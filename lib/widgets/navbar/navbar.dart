import 'package:cv/widgets/navbar/navbar_desktop.dart';
import 'package:cv/widgets/navbar/navbar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../providers/my_theme.dart';
import '../../providers/scroll.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: Provider.of<Scroll>(context).position(mediaQuery),
      child: Container(
        padding: EdgeInsets.only(top: Provider.of<Scroll>(context).padding(mediaQuery)),
        height: 80 + Provider.of<Scroll>(context).padding(mediaQuery),
        decoration: BoxDecoration(
          color: Provider.of<MyTheme>(context).current.primary,
          boxShadow: const [BoxShadow(offset: Offset(0, 6), color: Colors.black26)],
        ),
        child: ScreenTypeLayout(
          mobile: const NavbarMobile(),
          tablet: const NavbarDesktop(),
          desktop: const NavbarDesktop(),
        ),
      ),
    );
  }
}
