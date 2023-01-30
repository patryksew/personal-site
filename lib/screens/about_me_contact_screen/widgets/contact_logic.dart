import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widgets/dialogs/message_sent_dialog.dart';
import '../../../widgets/dialogs/my_alert_dialog.dart';

mixin ContactLogic<T extends StatefulWidget> on State<T> {
  static final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String? phone = '';
  String message = '';
  ContactType contactType = ContactType.email;

  bool isLoading = false;

  final List<DropdownMenuItem> dropdownItems = [
    const DropdownMenuItem(
      value: ContactType.email,
      child: Text("Email"),
    ),
    const DropdownMenuItem(
      value: ContactType.phone,
      child: Text("Telefon"),
    ),
  ];

  void submit(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (formKey.currentState == null) return;
    FormState formState = formKey.currentState!;
    if (!formState.validate()) return;
    formState.save();

    bool isConnected = !(await Connectivity().checkConnectivity() == ConnectivityResult.none);

    if (!isConnected) {
      showDialog(
          context: context,
          builder: (context) => const MyAlertDialog(
                title: "Urządzenie nie ma połączenia z internetem",
                content: "Wiadomośc zostanie wysłana, gdy urządzenie połączy się z internetem",
              ));
    }

    if (FirebaseAuth.instance.currentUser == null) {
      try {
        await FirebaseAuth.instance.signInAnonymously();
        await FirebaseFirestore.instance.collection("mail").doc(FirebaseAuth.instance.currentUser!.uid).set({});
      } catch (error) {
        showDialog(
            context: context,
            builder: ((context) => const MyAlertDialog(
                title: "Coś poszło nie tak",
                content: "Spróbuj ponownie później lub napisz na patryk.sewastianowicz@gmail.com")));
        return;
      }
    }
    await FirebaseFirestore.instance
        .collection("mail/${FirebaseAuth.instance.currentUser!.uid}/messages")
        .add({"name": name, "email": email, "phone": phone, "contact_type": contactType.name, "message": message});

    await showDialog(context: context, builder: (context) => MessageSentDialog(message: message));

    setState(() {
      isLoading = false;

      name = '';
      email = '';
      phone = '';
      message = '';
      contactType = ContactType.email;

      formState.reset();
    });
  }

  String? notEmptyValidator(String? value) {
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    return null;
  }

  String? phoneValidator(String? value) {
    if (contactType == ContactType.email && (value == null || value.isEmpty)) return null;
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    if (value.length < 9) return "Nr telefonu jest zbyt krótki";
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    if (!value.contains("@") || !value.contains(".")) return "Wprowadź poprawny adres email";
    return null;
  }
}

enum ContactType { email, phone }
