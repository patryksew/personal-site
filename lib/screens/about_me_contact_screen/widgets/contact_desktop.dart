import 'package:cv/providers/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<MyTheme>(context).current;

    final InputDecoration decoration = InputDecoration(
      fillColor: theme.background,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
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
                      label: "Imię",
                      child: TextFormField(
                        onSaved: (newValue) => _name = newValue!,
                        textInputAction: TextInputAction.next,
                        decoration: decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Email",
                      child: TextFormField(
                        onSaved: (newValue) => _email = newValue!,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: decoration,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _Wrapper(
                      label: "Numer telefonu",
                      child: TextFormField(
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
                        height: 61,
                        child: DropdownButtonFormField(
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: FaIcon(FontAwesomeIcons.caretDown, size: 21),
                          ),
                          decoration: decoration,
                          onChanged: (value) => _contactType = value as ContactType,
                          items: dropdownItems,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _Wrapper(
                      label: "Wiadomość",
                      child: SizedBox(
                        height: 126,
                        child: TextFormField(
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
                  onPressed: () {},
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
