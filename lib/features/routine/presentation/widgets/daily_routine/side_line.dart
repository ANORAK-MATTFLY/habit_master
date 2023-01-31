import 'package:flutter/material.dart';

Widget sideLine(Color color) => Container(
      height: 300.0,
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
