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
    List<Widget> containers = [];
    for (int i = 0; i < 10; i++) {
      containers.add(const TestContainer());
    }

    return Stack(
      children: [
        Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80 + Provider.of<Scroll>(context).padding),
            const AboutMeHeader(),
            const AboutMeContent(),
            Contact()
          ],
        ),
        const Navbar(),
      ],
    );
  }
}
