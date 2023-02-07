import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/open_site.dart';
import '../../providers/my_theme.dart';
import '../../widgets/navbar/language_dialog.dart';
import 'widgets/home_screen_icon_button.dart';
import 'widgets/home_screen_image.dart';
import 'widgets/home_screen_nav_item.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: const [
              Spacer(flex: 1),
              HomeScreenImage(355),
              Spacer(flex: 2),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SelectableText(
                  t.homeScreenWelcome,
                  style: TextStyle(
                      color: Provider.of<MyTheme>(context).current.onPrimary2,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SelectableText(
                  'Front-end developer.\nMobile developer.',
                  style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2, fontSize: 32),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  HomeScreenNavItem(t.aboutMe, targetId: "about_me"),
                  HomeScreenNavItem(t.contact, targetId: "contact"),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  HomeScreenIconButton(
                    FontAwesomeIcons.github,
                    onPressed: () => openSite(Site.gitHub),
                  ),
                  HomeScreenIconButton(
                    FontAwesomeIcons.linkedinIn,
                    onPressed: () => openSite(Site.linkedin),
                  ),
                  HomeScreenIconButton(
                    Provider.of<MyTheme>(context).isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
                    onPressed: Provider.of<MyTheme>(context, listen: false).toogleDarkMode,
                  ),
                  HomeScreenIconButton(
                    Icons.language,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => const LanguageDialog(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
