import 'dart:math';

import 'package:flutter/material.dart';

class Scroll extends ChangeNotifier {
  final ScrollController _controller = ScrollController();
  late MediaQueryData _mediaQuery;

  set mediaQuery(MediaQueryData val) {
    _mediaQuery = val;
  }

  Scroll() {
    _controller.addListener(() {
      notifyListeners();
    });
  }

  ScrollController get controller => _controller;
  double get offset => _controller.offset;

  double get position {
    double val = offset - _mediaQuery.size.height + _mediaQuery.padding.bottom;
    val = max(0, val);
    return val;
  }

  double get _position {
    return offset - _mediaQuery.size.height + _mediaQuery.padding.bottom;
  }

  double get padding {
    double val = min(_mediaQuery.padding.top, max(_position + _mediaQuery.padding.top, 0));
    return val;
  }
}
