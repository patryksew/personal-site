import 'package:cv/providers/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutMeHeaderMobile extends StatelessWidget {
  const AboutMeHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    MyThemeData myTheme = Provider.of<MyTheme>(context).current;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width,
      color: myTheme.primary2,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SelectableText(
            "O mnie",
            style: TextStyle(
              color: myTheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32.5),
            width: mediaQuery.size.width - 65,
            height: mediaQuery.size.width - 65,
            color: myTheme.secondary2,
            padding: const EdgeInsets.all(32.5),
            child: Container(color: Colors.grey),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: const SelectableText(
              "Nazywam się Patryk Sewastianowicz, jestem programistą front-end i mobile z rocznym doświadczeniem w branży. Posiadam umiejętności w takich technologiach jak HTML Flutter, JavaScript, Angular oraz Vue.",
              style: TextStyle(
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
