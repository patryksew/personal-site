import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_theme.dart';

class HomeScreenIconButton extends StatelessWidget {
  final IconData iconData;
  final String? text;
  final bool forceWhite;
  final VoidCallback? onPressed;

  const HomeScreenIconButton(this.iconData, {super.key, this.text, this.forceWhite = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    MyThemeData myTheme = Provider.of<MyTheme>(context).current;

    return Container(
      margin: const EdgeInsets.only(right: 13),
      child: TextButton.icon(
        onPressed: onPressed ?? () {},
        label: text != null
            ? Text(
                text!,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: myTheme.onPrimary2,
                ),
              )
            : Container(),
        icon: Icon(iconData, size: 40, color: forceWhite ? Colors.white : myTheme.onPrimary2),
      ),
    );
  }
}
