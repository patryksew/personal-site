import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/my_theme.dart';

class AboutMeItemMobile extends StatelessWidget {
  final String text;
  final String image;

  const AboutMeItemMobile({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    String image = "assets/${this.image}";
    bool isDarkMode = Provider.of<MyTheme>(context).isDarkMode;
    if (isDarkMode) image += "_white";
    image += ".png";

    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: SelectableText(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Provider.of<MyTheme>(context).current.onBackground, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
