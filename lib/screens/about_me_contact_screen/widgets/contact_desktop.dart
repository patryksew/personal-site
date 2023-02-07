import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_theme.dart';
import 'contact_logic.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> with ContactLogic {
  @override
  Widget build(BuildContext context) {
    super.passContext(context);

    final theme = Provider.of<MyTheme>(context).current;
    TextStyle textStyle = TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2);

    final InputDecoration decoration = InputDecoration(
      fillColor: theme.background,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      helperText: "",
      counterStyle: textStyle,
      errorStyle: const TextStyle(fontWeight: FontWeight.bold),
      errorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.red)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Form(
            key: ContactLogic.formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: SelectableText(
                    t.letsStayInTouch,
                    style: TextStyle(color: theme.onPrimary, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                ),
                Row(
                  children: [
                    _Wrapper(
                      label: "${t.name} *",
                      child: TextFormField(
                        style: textStyle,
                        validator: notEmptyValidator,
                        onSaved: (newValue) => name = newValue!,
                        textInputAction: TextInputAction.next,
                        decoration: decoration,
                      ),
                    ),
                    _Wrapper(
                      label: "Email *",
                      child: TextFormField(
                        style: textStyle,
                        validator: emailValidator,
                        onSaved: (newValue) => email = newValue!,
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
                      label: (t.phoneNumber + (contactType == ContactType.phone ? " *" : "")),
                      child: TextFormField(
                        style: textStyle,
                        validator: phoneValidator,
                        onSaved: (newValue) => phone = newValue!,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(9)],
                        decoration: decoration,
                      ),
                    ),
                    _Wrapper(
                      label: t.preferredContactType,
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
                            contactType = value as ContactType;
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
                      label: "${t.message} *",
                      child: SizedBox(
                        height: 126,
                        child: TextFormField(
                          style: textStyle,
                          validator: notEmptyValidator,
                          onSaved: (newValue) => message = newValue!,
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
                  onPressed: isLoading
                      ? null
                      : () {
                          submit();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.secondary2,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: const Icon(Icons.send, size: 40),
                  label: Text(
                    t.send,
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                  t.doYouPreferDirectContact,
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
                  SelectableText(
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
                  SelectableText(
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

  const _Wrapper({required this.child, required this.label});

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
