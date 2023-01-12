import 'dart:math';

import 'package:cv/providers/my_theme.dart';
import 'package:cv/widgets/navbar/navrow.dart';
import 'package:cv/widgets/navbar/navrow_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';
import 'navrow_logo.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenPadding = MediaQuery.of(context).size.width - 1700;

    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: Provider.of<Scroll>(context).position,
      child: Container(
        padding: EdgeInsets.only(top: Provider.of<Scroll>(context).padding),
        height: 80 + Provider.of<Scroll>(context).padding,
        decoration: BoxDecoration(
          color: Provider.of<MyTheme>(context).current.primary,
          boxShadow: const [BoxShadow(offset: Offset(0, 6), color: Colors.black26)],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: max(screenPadding, 0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              NavrowLogo(),
              Navrow(),
              NavrowIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
