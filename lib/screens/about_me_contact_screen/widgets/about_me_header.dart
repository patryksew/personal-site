import 'package:flutter/material.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          Container(
            color: Colors.pink,
            padding: const EdgeInsets.all(32.5),
            width: 480,
            height: 480,
            child: Container(color: Colors.grey),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "O mnie",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: const Text(
                    "Nazywam się Patryk Sewastianowicz, jestem programistą front-end i mobile z rocznym doświadczeniem w branży. Posiadam umiejętności w takich technologiach jak HTML Flutter, JavaScript, Angular oraz Vue.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
