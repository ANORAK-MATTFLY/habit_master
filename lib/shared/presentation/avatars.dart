import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  const AvatarPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: 130.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/elon-musk.png"),
        ),
      ),
    );
  }
}
