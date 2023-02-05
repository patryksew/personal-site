import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';
import '../../widgets/navbar/navbar.dart';
import 'widgets/about_me/about_me_content.dart';
import 'widgets/about_me/about_me_header.dart';
import 'widgets/contact.dart';

class AboutMeContactScreen extends StatelessWidget {
  const AboutMeContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenPadding = MediaQuery.of(context).size.width - 1700;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: max(screenPadding, 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80 + Provider.of<Scroll>(context).padding(MediaQuery.of(context))),
              const AboutMeHeader(key: GlobalObjectKey("about_me")),
              const AboutMeContent(),
              const Contact(key: GlobalObjectKey("contact"))
            ],
          ),
        ),
        const Navbar(),
      ],
    );
  }
}
