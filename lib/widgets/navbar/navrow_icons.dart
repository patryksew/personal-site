import 'package:cv/screens/home_screen/widgets/home_screen_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavrowIcons extends StatelessWidget {
  const NavrowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          HomeScreenIconButton(FontAwesomeIcons.github, isBright: true),
          HomeScreenIconButton(FontAwesomeIcons.linkedinIn, isBright: true),
          HomeScreenIconButton(Icons.dark_mode_outlined, isBright: true),
          HomeScreenIconButton(Icons.language, isBright: true),
        ],
      ),
    );
  }
}
