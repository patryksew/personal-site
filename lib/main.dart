import 'package:cv/providers/my_theme.dart';
import 'package:cv/screens/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: LandingScreen(),
      ),
    );
  }
}
