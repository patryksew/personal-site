import 'package:flutter/material.dart';

import '../icon_open_drawer.dart';
import 'navrow_logo.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: IconOpenDrawer(),
              ),
            ],
          ),
        ),
        const NavrowLogo(
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
