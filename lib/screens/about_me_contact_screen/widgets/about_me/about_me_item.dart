import 'package:cv/screens/about_me_contact_screen/widgets/about_me/about_me_item_desktop.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/about_me/about_me_item_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeItem extends StatelessWidget {
  final String text;
  final bool imageRight;

  const AboutMeItem({super.key, required this.text, this.imageRight = true});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutMeItemMobile(text: text),
      tablet: AboutMeItemDesktop(text: text, imageRight: imageRight),
      desktop: AboutMeItemDesktop(text: text, imageRight: imageRight),
    );
  }
}
