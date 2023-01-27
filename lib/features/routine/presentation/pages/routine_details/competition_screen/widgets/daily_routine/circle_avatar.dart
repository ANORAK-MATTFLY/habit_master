import 'package:flutter/material.dart';

Widget tinyCircleAvatar(String image, List<Color> colors) => Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: colors[0],
          width: 3.0,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(360.0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
        boxShadow: [
          BoxShadow(
            color: colors[1],
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(2, 9), // changes position of shadow
          ),
        ],
      ),
    );
