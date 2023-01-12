import 'package:cv/providers/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Provider.of<MyTheme>(context).current.background,
      title: Center(
        child: Text(
          "Wybierz język",
          style: TextStyle(color: Provider.of<MyTheme>(context).current.onBackground, fontSize: 25),
        ),
      ),
      children: [
        _Option(
          text: "🇵🇱  Polski",
          onPressed: () {
            print("Wybrano polski");
            Navigator.of(context).pop();
          },
        ),
        _Option(
          text: "🇬🇧  Angielski",
          onPressed: () {
            print("Wybrano angielski");
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

class _Option extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _Option({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Provider.of<MyTheme>(context).current.onPrimary2, fontSize: 18),
      ),
    );
  }
}
