import 'package:cv/widgets/icon_open_drawer.dart';
import 'package:cv/widgets/navbar/navrow_logo.dart';
import 'package:flutter/material.dart';

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
