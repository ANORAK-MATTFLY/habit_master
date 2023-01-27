import 'package:flutter/material.dart';

Widget sideIcon(bool isExpanded) {
  return isExpanded == true
      ? const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.grey,
          size: 30.0,
        )
      : const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.grey,
          size: 30.0,
        );
}
