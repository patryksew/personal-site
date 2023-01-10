import 'dart:math';

import 'package:cv/screens/about_me_contact_screen/about_me_contact_screen.dart';
import 'package:cv/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Scroll>(context, listen: false).mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: Provider.of<Scroll>(context, listen: false).controller,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            HomeScreen(),
            AboutMeContactScreen(),
          ],
        ),
      ),
    );
  }
}

class TestContainer extends StatelessWidget {
  const TestContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 200,
      color: randomColor(),
    );
  }
}

Random random = Random();

Color randomColor() {
  var colorsToChoose = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.amber,
    Colors.orange,
    Colors.indigo
  ];

  return colorsToChoose[random.nextInt(colorsToChoose.length)];
}
