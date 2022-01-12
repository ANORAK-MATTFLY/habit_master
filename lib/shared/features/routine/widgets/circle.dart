import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 130.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/circle.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
