import 'package:flutter/material.dart';

Widget habitOption(String text) => Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 225, 176, 254),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(69, 166, 63, 198),

            spreadRadius: 2,
            blurRadius: 15.0,
            offset: Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Twitterchirp",
          fontSize: 15.0,
          decoration: TextDecoration.none,
        ),
      ),
    );
