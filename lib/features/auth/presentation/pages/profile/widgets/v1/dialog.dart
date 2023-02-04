import 'package:flutter/material.dart';

Future openDialog(BuildContext context, String title, String hint) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(226, 39, 5, 49),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Submit"))
      ],
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "Twitterchirp_bold",
          fontSize: 15.0,
          decoration: TextDecoration.none,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(128, 255, 255, 255),
            fontFamily: "Twitterchirp",
            fontSize: 15.0,
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );
}
