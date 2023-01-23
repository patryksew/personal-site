import 'dart:math';

import 'package:cv/providers/my_theme.dart';
import 'package:cv/widgets/navbar/navrow.dart';
import 'package:cv/widgets/navbar/navrow_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';
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
          SizedBox(width: 25),
          NavrowLogo(),
          Navrow(),
          NavrowIcons(),
        ],
      ),
    );
  }
}
