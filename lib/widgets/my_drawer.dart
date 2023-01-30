import 'dart:ui';

import 'package:cv/helpers/open_site.dart';
import 'package:cv/screens/home_screen/widgets/home_screen_icon_button.dart';
import 'package:cv/screens/home_screen/widgets/home_screen_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyThemeData myTheme = Provider.of<MyTheme>(context).current;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Drawer(
          backgroundColor: myTheme.primary2.withOpacity(0.75),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(
                      color: myTheme.onPrimary2,
                      Icons.menu_open,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 35),
                  const HomeScreenNavItem("O mnie", targetId: "about_me"),
                  const HomeScreenNavItem("Kontakt", targetId: "contact"),
                  const SizedBox(height: 35),
                  HomeScreenIconButton(
                    FontAwesomeIcons.github,
                    text: "Github",
                    onPressed: () => openSite(Site.gitHub),
                  ),
                  HomeScreenIconButton(
                    FontAwesomeIcons.linkedinIn,
                    text: "Linkedin",
                    onPressed: () => openSite(Site.linkedin),
                  ),
                  HomeScreenIconButton(
                    Provider.of<MyTheme>(context).isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
                    text: "Tryb ciemny",
                    onPressed: Provider.of<MyTheme>(context, listen: false).toogleDarkMode,
                  ),
                  // HomeScreenIconButton(
                  //   Icons.language,
                  //   text: "Język",
                  //   onPressed: () => showDialog(
                  //     context: context,
                  //     builder: (_) => const LanguageDialog(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
