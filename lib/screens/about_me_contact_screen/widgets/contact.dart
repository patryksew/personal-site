import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helpers/screen_type_layout.dart';
import '../../../providers/my_theme.dart';
import 'contact_desktop.dart';
import 'contact_mobile.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<MyTheme>(context).current.primary2,
      child: const ScreenTypeLayout(
        mobile: ContactMobile(),
        desktop: ContactDesktop(),
      ),
    );
  }
}
