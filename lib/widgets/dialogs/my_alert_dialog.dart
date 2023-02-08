import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_theme.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<MyTheme>(context).current.background,
      title: SelectableText(
        title,
        style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2),
      ),
      content: SelectableText(
        content,
        style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "OK",
            style: TextStyle(color: Provider.of<MyTheme>(context).current.onBackground),
          ),
        )
      ],
    );
  }
}
