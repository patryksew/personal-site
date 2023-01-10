import 'package:cv/screens/about_me_contact_screen/widgets/contact_desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ScreenTypeLayout(
        mobile: const ContactDesktop(),
      ),
    );
  }
}
