import 'package:cv/helpers/scroll_to.dart';
import 'package:flutter/material.dart';

class Navrow extends StatelessWidget {
  const Navrow({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            scrollTo("about_me");
          },
          child: const Text(
            "O mnie",
            style: style,
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            scrollTo("contact");
          },
          child: const Text(
            "Kontakt",
            style: style,
          ),
        ),
      ],
    );
  }
}
