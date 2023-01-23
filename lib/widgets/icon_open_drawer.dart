import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_theme.dart';

class IconOpenDrawer extends StatelessWidget {
  const IconOpenDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: Icon(
        color: Provider.of<MyTheme>(context).current.onPrimary2,
        Icons.menu,
        size: 40,
      ),
    );
  }
}
