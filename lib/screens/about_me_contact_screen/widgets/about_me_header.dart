import 'package:cv/screens/about_me_contact_screen/widgets/about_me_header_desktop.dart';
import 'package:cv/screens/about_me_contact_screen/widgets/about_me_header_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const AboutMeHeaderMobile(),
      tablet: const AboutMeHeaderDesktop(),
      desktop: const AboutMeHeaderDesktop(),
    );
  }
}
