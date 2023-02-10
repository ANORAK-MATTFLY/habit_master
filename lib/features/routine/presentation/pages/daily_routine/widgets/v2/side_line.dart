import 'package:flutter/material.dart';

Widget sideLine(Color color, {required double height}) => Container(
      height: height,
      width: 2,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 7,
            blurRadius: 10,
            offset: const Offset(2, 9),
          ),
        ],
      ),
    );
