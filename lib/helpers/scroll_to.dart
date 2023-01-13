import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scroll.dart';

void scrollTo(String id) {
  print(id);

  BuildContext? targetContext = GlobalObjectKey(id).currentContext;
  if (targetContext == null) return;

  Scroll scrollProvider = Provider.of<Scroll>(targetContext, listen: false);
  ScrollController controller = scrollProvider.controller;

  if (id == "about_me") {
    controller.animateTo(MediaQuery.of(targetContext).size.height,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    return;
  }
  if (id == "home") {
    controller.animateTo(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    return;
  }
  Scrollable.ensureVisible(targetContext, duration: const Duration(milliseconds: 500));
}
