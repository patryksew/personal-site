import 'package:flutter/material.dart';

class HomeScreenImage extends StatelessWidget {
  final double size;
  const HomeScreenImage(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(4, 4), color: Colors.black26),
        ],
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: ClipOval(child: Image.asset('assets/portrait_1.jpg')),
    );
  }
}
