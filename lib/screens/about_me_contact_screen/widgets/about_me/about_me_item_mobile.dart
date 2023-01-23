import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/my_theme.dart';

class AboutMeItemMobile extends StatelessWidget {
  final String text;
  const AboutMeItemMobile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
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
