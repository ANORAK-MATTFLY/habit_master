import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/login_bg.png"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: const BoxDecoration(
                      color: Color(0xBD33104F),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 50.0),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Twitterchirp_Bold",
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "Practice daily habits made by highly prodctive people like Elon musk and more!",
                                style: TextStyle(
                                  color: Color(0xFFD4D3D3),
                                  fontFamily: "Twitterchirp",
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
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
                                                Radius.circular(5.0)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        color: const Color(0xBD33104F),
                        child: const Center(
                          child: Text(
                            "X",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
