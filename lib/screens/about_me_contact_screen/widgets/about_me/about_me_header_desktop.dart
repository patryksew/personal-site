import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../providers/my_theme.dart';

class AboutMeHeaderDesktop extends StatelessWidget {
  const AboutMeHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    MyThemeData myTheme = Provider.of<MyTheme>(context).current;

    return Container(
      color: myTheme.primary2,
      child: Row(
        children: [
          Container(
            color: myTheme.secondary2,
            padding: const EdgeInsets.all(32.5),
            width: 480,
            height: 480,
            child: Image.asset('assets/portrait_2.jpg'),
          ),
          Expanded(
            child: Column(
              children: [
                SelectableText(
                  t.aboutMe,
                  style: TextStyle(
                    color: myTheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: SelectableText(
                    t.aboutMeHeader,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
