import 'package:cv/screens/home_screen/widgets/home_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_theme.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          const Spacer(),
          const HomeScreenImage(200),
          SelectableText(
            "Cześć, jestem Patryk",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Provider.of<MyTheme>(context).current.onPrimary2,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          SelectableText(
            'Front-end developer.\nMobile developer.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Provider.of<MyTheme>(context).current.onPrimary2,
              fontSize: 32,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
