import 'package:cv/providers/my_theme.dart';
import 'package:flutter/material.dart';
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
  String _phone = '';
  String _message = '';
  _ContactType _contactType = _ContactType.email;

  @override
  Widget build(BuildContext context) {
    final InputDecoration _decoration = InputDecoration(
      fillColor: Provider.of<MyTheme>(context).current.background,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 520,
          width: 480,
          color: Provider.of<MyTheme>(context).current.secondary2,
        ),
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Text(
                    "Bądźmy w kontakcie",
                    style: TextStyle(
                        color: Provider.of<MyTheme>(context).current.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 48),
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
                Row(
                  children: [
                    _Wrapper(
                      label: "Wiadomość",
                      child: SizedBox(
                        height: 126,
                        child: TextFormField(
                          scrollController: ScrollController(),
                          decoration: _decoration,
                          keyboardType: TextInputType.multiline,
                          maxLines: 50,
                          minLines: 3,
                          maxLength: 1000,
                        ),
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

enum _ContactType { email, phone }
