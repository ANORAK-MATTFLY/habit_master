import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: Container(
        width: 130.0,
        height: 130.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF4158D0), Color(0xFFC850C0), Color(0xFFFFCC70)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.3, 0.8],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}
