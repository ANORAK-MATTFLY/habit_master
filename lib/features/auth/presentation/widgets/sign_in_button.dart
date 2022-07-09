import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 290.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 103, 9, 165).withOpacity(0.5),
              const Color.fromARGB(255, 255, 10, 10).withOpacity(0.5)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.0, 0.9],
            tileMode: TileMode.clamp),
      ),
      child: const Center(
        child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Twitterchirp_Bold",
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.clip,
          ),
        ),
      ),
    );
  }
}
