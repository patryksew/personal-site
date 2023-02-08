import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale? _current;

  Locale? get current => _current;

  void setLocale(String langCode) {
    _current = Locale(langCode);

    notifyListeners();
  }
}
