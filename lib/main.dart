import 'package:flutter/material.dart';
import 'package:patryk_sewastianowicz/providers/locale_notifier.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

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
        ChangeNotifierProvider<MyTheme>(create: (_) => MyTheme()),
        ChangeNotifierProvider<LocaleNotifier>(create: (_) => LocaleNotifier()),
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
