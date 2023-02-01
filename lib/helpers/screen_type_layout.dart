import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  final double breakpoint;

  final Widget desktop;
  final Widget mobile;

  const ScreenTypeLayout({super.key, required this.desktop, required this.mobile, this.breakpoint = 1000});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > breakpoint) return desktop;
    return mobile;
  }
}
