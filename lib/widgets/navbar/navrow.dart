import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_theme.dart';

class Navrow extends StatelessWidget {
  const Navrow({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
    TextStyle selectedStyle =
        TextStyle(color: Provider.of<MyTheme>(context).current.secondary, fontWeight: FontWeight.bold, fontSize: 20);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "O mnie",
            style: selectedStyle,
          ),
          const SizedBox(width: 10),
          const Text(
            "Kontakt",
            style: style,
          ),
          const SizedBox(width: 10),
          const Text(
            "Projekty",
            style: style,
          ),
        ],
      ),
    );
  }
}
