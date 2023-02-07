import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/scroll_to.dart';

class Navrow extends StatelessWidget {
  const Navrow({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    const TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            scrollTo("about_me");
          },
          child: Text(
            t.aboutMe,
            style: style,
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            scrollTo("contact");
          },
          child: Text(
            t.contact,
            style: style,
          ),
        ),
      ],
    );
  }
}
