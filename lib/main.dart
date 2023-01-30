import 'package:cv/providers/my_theme.dart';
import 'package:cv/screens/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

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
    ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 1000, tablet: 1000, watch: 0),
    );
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: LandingScreen(),
      ),
    );
  }
}
