import 'package:flutter/material.dart';

Widget sideLine(Color color) => Container(
      height: 300.0,
      width: 2,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(73, 255, 238, 1).withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(2, 9), // changes position of shadow
          ),
        ],
      ),
    );
