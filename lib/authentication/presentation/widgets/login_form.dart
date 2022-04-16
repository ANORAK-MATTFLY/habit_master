import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlineGradientButton(
              padding: const EdgeInsets.all(3),
              strokeWidth: 1,
              radius: const Radius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9F56DA),
                  Color(0xCBA8B2EE),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.9],
                tileMode: TileMode.clamp,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF33104F),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        color: Color(0xFF200A33),
                      ),
                      child: const Icon(
                        Icons.email_outlined,
                        color: Color(0xFFB4B4B4),
                      ),
                    ),
                    labelText: "E-mail address",
                    labelStyle: const TextStyle(
                      color: Color(0xFFB4B4B4),
                      fontFamily: "Twitterchirp",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            OutlineGradientButton(
              padding: const EdgeInsets.all(3.0),
              strokeWidth: 1,
              radius: const Radius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9F56DA),
                  Color(0xCBA8B2EE),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.9],
                tileMode: TileMode.clamp,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF33104F),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xFF200A33),
                      ),
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: Color(0xFFB4B4B4),
                        // size: 20.0,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: Color(0xFFB4B4B4),
                      fontFamily: "Twitterchirp",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            OutlineGradientButton(
              padding: const EdgeInsets.all(3.0),
              strokeWidth: 1,
              radius: const Radius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFF38123),
                  Color(0xFFC246E0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp,
              ),
              child: Container(
                  height: 50.0,
                  width: double.infinity,
                  // margin: const EdgeInsets.symmetric(
                  //     horizontal: 15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF33104F),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFB4B4B4),
                        fontFamily: "Twitterchirp",
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "You don't have an account?  ",
                      style: TextStyle(
                        color: Color(0xFFD4D3D3),
                        fontFamily: "Twitterchirp",
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        color: Color(0xFFA577FC),
                        fontFamily: "Twitterchirp_Bold",
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
