import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  bool isDarkMode = false;

  final MyThemeData lightTheme = MyThemeData(
    primary: const Color.fromRGBO(35, 165, 206, 1),
    primary2: const Color.fromRGBO(7, 148, 192, 1),
    secondary: Color.fromARGB(255, 212, 11, 132),
    secondary2: const Color.fromRGBO(237, 93, 179, 1),
    background: const Color.fromRGBO(255, 255, 255, 1),
    onBackground: const Color.fromRGBO(9, 107, 150, 1),
    onPrimary: const Color.fromRGBO(237, 93, 179, 1),
    onPrimary2: Colors.black,
    homeGradient2: const Color.fromRGBO(218, 244, 252, 1),
  );

  final MyThemeData darkTheme = MyThemeData(
    primary: const Color.fromRGBO(0, 0, 0, 1),
    primary2: const Color.fromRGBO(0, 62, 82, 1),
    secondary: const Color.fromRGBO(255, 0, 153, 1),
    secondary2: const Color.fromRGBO(131, 43, 96, 1),
    background: const Color.fromRGBO(41, 41, 41, 1),
    onBackground: const Color.fromRGBO(23, 186, 255, 1),
    onPrimary: const Color.fromRGBO(237, 93, 179, 1),
    onPrimary2: Colors.white,
    homeGradient2: const Color.fromRGBO(0, 143, 188, 1),
  );

  late MyThemeData _current;

  MyThemeData get current => _current;

  MyTheme() {
    _current = lightTheme;
  }

  void toogleDarkMode() {
    if (isDarkMode) {
      isDarkMode = false;
      _current = lightTheme;
    } else {
      isDarkMode = true;
      _current = darkTheme;
    }

    notifyListeners();
  }
}

class MyThemeData {
  final Color primary;
  final Color primary2;
  final Color secondary;
  final Color secondary2;
  final Color background;
  final Color onBackground;
  final Color onPrimary;
  final Color onPrimary2;
  final Color homeGradient2;

  MyThemeData({
    required this.primary,
    required this.primary2,
    required this.secondary,
    required this.secondary2,
    required this.background,
    required this.onBackground,
    required this.onPrimary,
    required this.onPrimary2,
    required this.homeGradient2,
  });
}
