import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/home_screen_icon_button.dart';
import 'widgets/home_screen_image.dart';
import 'widgets/home_screen_nav_item.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HomeScreenImage(355),
          const SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: SelectableText(
                  'Cześć, jestem Patryk',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: SelectableText(
                  'Front-end developer.\nMobile developer.',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: const [
                  HomeScreenNavItem('O mnie'),
                  HomeScreenNavItem('Kontakt'),
                  HomeScreenNavItem('Projekty'),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: const [
                  HomeScreenIconButton(FontAwesomeIcons.github),
                  HomeScreenIconButton(FontAwesomeIcons.linkedinIn),
                  HomeScreenIconButton(Icons.dark_mode_outlined),
                  HomeScreenIconButton(Icons.language),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
