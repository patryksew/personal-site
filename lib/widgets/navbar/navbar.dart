import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helpers/screen_type_layout.dart';

import '../../providers/my_theme.dart';
import '../../providers/scroll.dart';
import 'navbar_desktop.dart';
import 'navbar_mobile.dart';

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
        child: const ScreenTypeLayout(
          mobile: NavbarMobile(),
          desktop: NavbarDesktop(),
        ),
      ),
    );
  }
}
