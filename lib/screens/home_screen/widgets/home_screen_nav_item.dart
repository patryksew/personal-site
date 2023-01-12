import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_theme.dart';

class HomeScreenNavItem extends StatelessWidget {
  final String text;
  const HomeScreenNavItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 32, color: Provider.of<MyTheme>(context).current.secondary),
        ),
      ),
    );
  }
}
