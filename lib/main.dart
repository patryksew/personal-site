import 'package:flutter/material.dart';
import 'package:patryk_sewastianowicz/providers/localeNotifier.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'providers/my_theme.dart';
import 'screens/landing_screen/landing_screen.dart';

void main() {
  runApp(const MyApp());
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MyTheme>(create: (_) => MyTheme()),
        Provider<LocaleNotifier>(create: (_) => LocaleNotifier()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: Provider.of<LocaleNotifier>(context).current,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Patryk Sewastianowicz',
          home: const LandingScreen(),
        );
      }),
    );
  }
}
