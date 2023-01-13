import 'dart:math';

import 'package:cv/screens/about_me_contact_screen/widgets/about_me_content.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/about_me_header.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/contact.dart';
import 'package:cv/screens/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scroll.dart';
import '../../widgets/navbar/navbar.dart';

class AboutMeContactScreen extends StatelessWidget {
  const AboutMeContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenPadding = MediaQuery.of(context).size.width - 1700;

    return Stack(
      children: [
        Container(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: max(screenPadding, 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80 + Provider.of<Scroll>(context).padding(MediaQuery.of(context))),
              const AboutMeHeader(),
              const AboutMeContent(),
              const Contact()
            ],
          ),
        ),
        const Navbar(),
      ],
    );
  }
}
