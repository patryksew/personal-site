import 'package:cv/helpers/scroll_to.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_theme.dart';

class HomeScreenNavItem extends StatelessWidget {
  final String text;
  final String targetId;
  const HomeScreenNavItem(this.text, {required this.targetId, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () {
          scrollTo(targetId);
          Scaffold.of(context).closeDrawer();
        },
        child: SelectableText(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 32, color: Provider.of<MyTheme>(context).current.secondary),
        ),
      ),
    );
  }
}
