import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final t = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: Provider.of<MyTheme>(context).current.background,
      title: SelectableText(
        t.messageSent,
        style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2),
      ),
      content: SelectableText(
        "${t.messageContent}:\n$_message",
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
