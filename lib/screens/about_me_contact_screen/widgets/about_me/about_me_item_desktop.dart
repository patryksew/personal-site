import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/my_theme.dart';

class AboutMeItemDesktop extends StatelessWidget {
  final String text;
  final String image;
  final bool imageRight;

  const AboutMeItemDesktop({super.key, required this.text, this.imageRight = true, required this.image});

  @override
  Widget build(BuildContext context) {
    String image = "assets/${this.image}";
    bool isDarkMode = Provider.of<MyTheme>(context).isDarkMode;
    if (isDarkMode) image += "_white";
    image += ".png";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
      child: Row(
        textDirection: !imageRight ? TextDirection.rtl : null,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: SelectableText(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Provider.of<MyTheme>(context).current.onBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            width: 300,
            child: Image.asset(image, gaplessPlayback: true),
          ),
        ],
      ),
    );
  }
}
