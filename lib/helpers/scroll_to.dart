import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scroll.dart';

void scrollTo(String id) {
  BuildContext? targetContext = GlobalObjectKey(id).currentContext;
  if (targetContext == null) return;

  Scroll scrollProvider = Provider.of<Scroll>(targetContext, listen: false);
  ScrollController controller = scrollProvider.controller;

  final renderBox = targetContext.findRenderObject() as RenderBox?;
  if (renderBox == null) return;
  var position = renderBox.localToGlobal(Offset.zero).dy;
  position -= scrollProvider.padding(MediaQuery.of(targetContext)) + 80;
  position += controller.offset;
  position = max(0, position);

  controller.animateTo(position, duration: const Duration(milliseconds: 500), curve: Curves.ease);
}
