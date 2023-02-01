import 'package:cv/screens/about_me_contact_screen/widgets/about_me/about_me_item_desktop.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/about_me/about_me_item_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../helpers/screen_type_layout.dart';

class AboutMeItem extends StatelessWidget {
  final String text;
  final String image;
  final bool imageRight;

  const AboutMeItem({super.key, required this.text, this.imageRight = true, required this.image});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutMeItemMobile(text: text, image: image),
      desktop: AboutMeItemDesktop(
        text: text,
        imageRight: imageRight,
        image: image,
      ),
    );
  }
}
