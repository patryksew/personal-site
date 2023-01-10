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
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: Provider.of<Scroll>(context).position,
      child: Container(
        padding: EdgeInsets.only(top: Provider.of<Scroll>(context).padding),
        height: 80 + Provider.of<Scroll>(context).padding,
        decoration: const BoxDecoration(
          color: Colors.blue,
          boxShadow: [BoxShadow(offset: Offset(0, 6), color: Colors.black26)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavrowLogo(),
            Navrow(),
            NavrowIcons(),
          ],
        ),
      ),
    );
  }
}
