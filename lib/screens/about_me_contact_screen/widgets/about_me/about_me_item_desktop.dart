import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/my_theme.dart';

class AboutMeItemDesktop extends StatelessWidget {
  final String text;
  final bool imageRight;

  const AboutMeItemDesktop({super.key, required this.text, this.imageRight = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
      child: Row(
        textDirection: !imageRight ? TextDirection.rtl : null,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
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
            color: Colors.red,
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
