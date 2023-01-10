import 'package:flutter/material.dart';

class HomeScreenNavItem extends StatelessWidget {
  final String text;
  const HomeScreenNavItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.pink),
        ),
      ),
    );
  }
}
