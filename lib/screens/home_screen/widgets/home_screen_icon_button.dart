import 'package:flutter/material.dart';

class HomeScreenIconButton extends StatelessWidget {
  final IconData iconData;
  final String? text;
  final bool isBright;

  const HomeScreenIconButton(this.iconData, {super.key, this.text, this.isBright = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 13),
      child: TextButton.icon(
        onPressed: () {},
        label: text != null ? Text(text!) : Container(),
        icon: Icon(iconData, size: 40, color: isBright ? Colors.white : Colors.black),
      ),
    );
  }
}
