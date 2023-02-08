import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../providers/my_theme.dart';

class AboutMeHeaderMobile extends StatelessWidget {
  const AboutMeHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    MyThemeData myTheme = Provider.of<MyTheme>(context).current;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width,
      color: myTheme.primary2,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SelectableText(
            t.aboutMe,
            style: TextStyle(
              color: myTheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: myTheme.secondary2,
            padding: const EdgeInsets.all(15),
            child: Image.asset('assets/portrait_2.jpg'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: SelectableText(
              t.aboutMeHeader,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
