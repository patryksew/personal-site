import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cv/providers/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../widgets/dialogs/message_sent_dialog.dart';
import '../../../widgets/dialogs/my_alert_dialog.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String? _phone = '';
  String _message = '';
  ContactType _contactType = ContactType.email;

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
    await FirebaseAuth.instance.signOut();

    if (_formKey.currentState == null) return;
    FormState formState = _formKey.currentState!;
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
        .add({"name": _name, "email": _email, "phone": _phone, "contact_type": _contactType.name, "message": _message});

    await showDialog(context: context, builder: (context) => MessageSentDialog(message: _message));

    _name = '';
    _email = '';
    _phone = '';
    _message = '';
    _contactType = ContactType.email;

    formState.reset();
  }

  String? notEmptyValidator(String? value) {
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    return null;
  }

  String? phoneValidator(String? value) {
    if (_contactType == ContactType.email && (value == null || value.isEmpty)) return null;
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    if (value.length < 9) return "Nr telefonu jest zbyt krótki";
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "To pole nie może być puste";
    if (!value.contains("@") || !value.contains(".")) return "Wprowadź poprawny adres email";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<MyTheme>(context).current;
    TextStyle textStyle = TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2);

    final InputDecoration decoration = InputDecoration(
      fillColor: theme.background,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      helperText: "",
      errorStyle: const TextStyle(fontWeight: FontWeight.bold),
      errorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.red)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Text(
                    "Bądźmy w kontakcie",
                    style: TextStyle(color: theme.onPrimary, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                ),
                Row(
                  children: [
                    _Wrapper(
                      label: "Imię *",
                      child: TextFormField(
                        style: textStyle,
                        validator: notEmptyValidator,
                        onSaved: (newValue) => _name = newValue!,
                        textInputAction: TextInputAction.next,
                        decoration: decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Email *",
                      child: TextFormField(
                        style: textStyle,
                        validator: emailValidator,
                        onSaved: (newValue) => _email = newValue!,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: decoration,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _Wrapper(
                      // ignore: prefer_interpolation_to_compose_strings
                      label: ("Numer telefonu" + (_contactType == ContactType.phone ? " *" : "")),
                      child: TextFormField(
                        style: textStyle,
                        validator: phoneValidator,
                        onSaved: (newValue) => _phone = newValue!,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(9)],
                        decoration: decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Preferowany typ kontaktu",
                      child: SizedBox(
                        height: 84,
                        child: DropdownButtonFormField(
                          style: textStyle,
                          dropdownColor: theme.background,
                          value: ContactType.email,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: FaIcon(FontAwesomeIcons.caretDown, size: 21),
                          ),
                          decoration: decoration,
                          onChanged: (value) => setState(() {
                            _contactType = value as ContactType;
                          }),
                          items: dropdownItems,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _Wrapper(
                      label: "Wiadomość *",
                      child: SizedBox(
                        height: 126,
                        child: TextFormField(
                          style: textStyle,
                          validator: notEmptyValidator,
                          onSaved: (newValue) => _message = newValue!,
                          scrollController: ScrollController(),
                          decoration: decoration,
                          keyboardType: TextInputType.multiline,
                          maxLines: 50,
                          minLines: 3,
                          maxLength: 1000,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    submit(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.secondary2,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: const Icon(Icons.send, size: 40),
                  label: const Text(
                    "Wyślij",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
        Container(
          height: 650,
          width: 480,
          color: theme.secondary2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Wolisz bezpośredni kontakt?",
                  style: TextStyle(
                    color: theme.onPrimary2,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    size: 30,
                    color: theme.onPrimary2,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "508 394 295",
                    style: TextStyle(color: theme.onPrimary2, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    size: 30,
                    color: theme.onPrimary2,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "patryk.sewastianowicz@gmail.com",
                    style: TextStyle(color: theme.onPrimary2, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Wrapper extends StatelessWidget {
  final Widget child;
  final String label;

  const _Wrapper({super.key, required this.child, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}

enum ContactType { email, phone }
