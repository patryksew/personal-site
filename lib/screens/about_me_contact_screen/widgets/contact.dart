import 'package:cv/providers/my_theme.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/contact_desktop.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/contact_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<MyTheme>(context).current.primary2,
      child: ScreenTypeLayout(
        mobile: const ContactMobile(),
        tablet: const ContactDesktop(),
        desktop: const ContactDesktop(),
      ),
    );
  }
}
