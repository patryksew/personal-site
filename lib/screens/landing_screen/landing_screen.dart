import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';
import '../../widgets/my_drawer.dart';
import '../about_me_contact_screen/about_me_contact_screen.dart';
import '../home_screen/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Scroll(),
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) => SingleChildScrollView(
            controller: Provider.of<Scroll>(context, listen: false).controller,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                HomeScreen(key: GlobalObjectKey("home")),
                AboutMeContactScreen(),
              ],
            ),
          ),
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
