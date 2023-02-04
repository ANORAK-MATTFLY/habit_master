import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget progress(String ratio, Color color) => Container(
      height: 25.0,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        color: color,
      ),
      child: Center(
        child: Text(
          ratio,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Twitterchirp_bold",
            fontSize: 13.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    )
        .animate()
        .slideY(begin: -0.4, duration: const Duration(milliseconds: 400),)
        .then()
        .slide(
          begin: const Offset(-0.2, 0),
          duration: const Duration(milliseconds: 700),
        );
