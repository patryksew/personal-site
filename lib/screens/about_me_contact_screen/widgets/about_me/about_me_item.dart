import 'package:flutter/material.dart';
import '../../../../helpers/screen_type_layout.dart';
import 'about_me_item_desktop.dart';
import 'about_me_item_mobile.dart';

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
