import 'package:flutter/material.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _message = '';
  _ContactType _contactType = _ContactType.email;

  final InputDecoration _decoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Icon(
              Icons.drafts_outlined,
              size: 100,
              color: Colors.pink,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 480,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const Text(
                    "Bądźmy w kontakcie",
                    style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                ),
                Row(
                  children: [
                    _Wrapper(
                      label: "Imię",
                      child: TextFormField(
                        decoration: _decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Email",
                      child: TextFormField(
                        decoration: _decoration,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _Wrapper(
                      label: "Imię",
                      child: TextFormField(
                        decoration: _decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Email",
                      child: TextFormField(
                        decoration: _decoration,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _Wrapper(
                      label: "Wiadomość",
                      child: TextFormField(
                        decoration: _decoration,
                        keyboardType: TextInputType.multiline,
                        maxLines: 50,
                        minLines: 3,
                        maxLength: 1000,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
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

enum _ContactType { email, phone }
