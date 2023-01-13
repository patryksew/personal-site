import 'package:cv/helpers/scroll_to.dart';
import 'package:flutter/material.dart';

class NavrowLogo extends StatelessWidget {
  const NavrowLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          scrollTo("home");
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: const Text(
                "Patryk\nSewastianowicz",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
