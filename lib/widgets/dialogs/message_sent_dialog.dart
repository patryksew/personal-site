import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_theme.dart';

class MessageSentDialog extends StatelessWidget {
  const MessageSentDialog({
    Key? key,
    required String message,
  })  : _message = message,
        super(key: key);

  final String _message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Provider.of<MyTheme>(context).current.background,
      title: SelectableText(
        "Wiadomość wysłana",
        style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2),
      ),
      content: SelectableText(
        "Treść wiadomości:\n$_message",
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
