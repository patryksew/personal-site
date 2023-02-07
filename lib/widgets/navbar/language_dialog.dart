import 'package:flutter/material.dart';
import 'package:patryk_sewastianowicz/providers/locale_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_theme.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    LocaleNotifier localeProvider = Provider.of<LocaleNotifier>(context, listen: false);

    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Provider.of<MyTheme>(context).current.background,
      title: Center(
        child: Text(
          t.selectLanguage,
          style: TextStyle(color: Provider.of<MyTheme>(context).current.onBackground, fontSize: 25),
        ),
      ),
      children: [
        _Option(
          text: "🇵🇱  Polski",
          onPressed: () {
            localeProvider.setLocale("pl");
            Navigator.of(context).pop();
          },
        ),
        _Option(
          text: "🇬🇧  Eglish",
          onPressed: () {
            localeProvider.setLocale("en");
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

  const _Option({required this.text, required this.onPressed});

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
