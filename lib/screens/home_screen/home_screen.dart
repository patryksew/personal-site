import 'package:cv/providers/my_theme.dart';
import 'package:cv/screens/home_screen/home_screen_desktop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    height -= padding.bottom;
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Provider.of<MyTheme>(context).current.primary2,
              Provider.of<MyTheme>(context).current.homeGradient2
            ],
          ),
        ),
        child: ScreenTypeLayout(
          mobile: const HomeScreenDesktop(),
          desktop: const HomeScreenDesktop(),
        ),
      ),
    );
  }
}
