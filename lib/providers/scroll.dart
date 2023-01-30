import 'dart:math';

import 'package:flutter/material.dart';

class Scroll extends ChangeNotifier {
  final ScrollController _controller = ScrollController();

  Scroll() {
    _controller.addListener(() {
      notifyListeners();
    });
  }

  ScrollController get controller => _controller;
  double get offset => _controller.offset;

  double position(MediaQueryData mediaQuery) {
    double homeScreenHeight = max(mediaQuery.size.height, 530);
    double val = offset - homeScreenHeight + mediaQuery.padding.bottom;
    val = max(0, val);
    return val;
  }

  double _position(MediaQueryData mediaQuery) {
    return offset - mediaQuery.size.height + mediaQuery.padding.bottom;
  }

  double padding(MediaQueryData mediaQuery) {
    double val = min(mediaQuery.padding.top, max(_position(mediaQuery) + mediaQuery.padding.top, 0));
    return val;
  }
}
