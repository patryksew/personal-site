import 'package:cv/screens/home_screen/widgets/home_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_theme.dart';
import '../../widgets/icon_open_drawer.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    MyThemeData myTheme = Provider.of<MyTheme>(context).current;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                IconOpenDrawer(),
              ],
            ),
            const Spacer(),
            const HomeScreenImage(200),
            const SizedBox(height: 70),
            SelectableText(
              "Cześć, jestem Patryk",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: myTheme.onPrimary2,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 40),
            SelectableText(
              'Front-end developer.\nMobile developer.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: myTheme.onPrimary2,
                fontSize: 32,
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
