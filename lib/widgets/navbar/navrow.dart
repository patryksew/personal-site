import 'package:flutter/material.dart';

class Navrow extends StatelessWidget {
  const Navrow({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
    const TextStyle selectedStyle = TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 20);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "O mnie",
            style: selectedStyle,
          ),
          SizedBox(width: 10),
          Text(
            "Kontakt",
            style: style,
          ),
          SizedBox(width: 10),
          Text(
            "Projekty",
            style: style,
          ),
        ],
      ),
    );
  }
}
