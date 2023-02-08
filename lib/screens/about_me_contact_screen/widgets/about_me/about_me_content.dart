import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../helpers/download_cv.dart';
import '../../../../providers/my_theme.dart';
import 'about_me_item.dart';

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      color: Provider.of<MyTheme>(context).current.background,
      child: Column(
        children: [
          const SizedBox(height: 60),
          AboutMeItem(
            text: t.aboutMeContent1,
            image: "laptop_drawing",
          ),
          AboutMeItem(
            text: t.aboutMeContent2,
            imageRight: false,
            image: "smartphone",
          ),
          AboutMeItem(
            text: t.aboutMeContent2,
            image: "man_with_coffe_laptop",
          ),
          ElevatedButton.icon(
            onPressed: () {
              downloadCv(Localizations.localeOf(context).languageCode);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Provider.of<MyTheme>(context).current.primary2,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            icon: const Icon(Icons.download, size: 40),
            label: Text(
              t.downloadCv,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
