import 'package:cv/providers/my_theme.dart';
import 'package:cv/screens/home_screen/widgets/home_screen_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavrowIcons extends StatelessWidget {
  const NavrowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const HomeScreenIconButton(FontAwesomeIcons.github, forceWhite: true),
          const HomeScreenIconButton(FontAwesomeIcons.linkedinIn, forceWhite: true),
          HomeScreenIconButton(
            Provider.of<MyTheme>(context).isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
            forceWhite: true,
            onPressed: Provider.of<MyTheme>(context, listen: false).toogleDarkMode,
          ),
          const HomeScreenIconButton(Icons.language, forceWhite: true),
        ],
      ),
    );
  }
}