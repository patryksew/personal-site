import 'dart:math';

import 'package:flutter/material.dart';

import 'navrow.dart';
import 'navrow_icons.dart';
import 'navrow_logo.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenPadding = MediaQuery.of(context).size.width - 1700;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: max(screenPadding, 0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Expanded(child: NavrowLogo()),
          Expanded(child: Navrow()),
          Expanded(child: NavrowIcons()),
        ],
      ),
    );
  }
}
