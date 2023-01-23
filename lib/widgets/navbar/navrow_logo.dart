import 'package:cv/helpers/scroll_to.dart';
import 'package:flutter/material.dart';

class NavrowLogo extends StatelessWidget {
  final TextAlign textAlign;

  const NavrowLogo({Key? key, this.textAlign = TextAlign.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: TextButton(
        onPressed: () {
          scrollTo("home");
        },
        child: Text(
          "Patryk\nSewastianowicz",
          textAlign: textAlign,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
