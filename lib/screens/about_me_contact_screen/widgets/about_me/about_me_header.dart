import 'package:flutter/material.dart';

import '../../../../helpers/screen_type_layout.dart';
import 'about_me_header_desktop.dart';
import 'about_me_header_mobile.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: AboutMeHeaderMobile(),
      desktop: AboutMeHeaderDesktop(),
    );
  }
}
