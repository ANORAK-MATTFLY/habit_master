import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../widgets/sign_in_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isOnboardingVisible = true;
  bool canShowSignInPopUp = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: isOnboardingVisible,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: (height - 22.0),
                width: (width - 20.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 195, 195, 195),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
            Container(
              height: (height - 20.0),
              width: width,
              decoration: const BoxDecoration(
                color: Color(0xFF060C14),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: SizedBox(
                height: height - 3.0,
                width: width,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(right: 0.0),
                          child: const RiveAnimation.asset(
                              'assets/rive_assets/shapes.riv',
                              fit: BoxFit.fitWidth)),
                    ),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 50.0),
                          child: const RiveAnimation.asset(
                              'assets/rive_assets/shapes.riv',
                              fit: BoxFit.fitWidth)),
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Container(
                        margin: const EdgeInsets.only(left: 15.0, bottom: 0.0),
                        height: 400,
                        width: 400,
                        child: const RiveAnimation.asset(
                            'assets/rive_assets/shapes.riv',
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: (height - 20.0),
                      child: Blur(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        blur: 60,
                        colorOpacity: 0.0,
                        blurColor: const Color.fromARGB(0, 255, 255, 255),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 70.0, right: 15.0),
                      height: (height - 100.0),
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250.0,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isOnboardingVisible =
                                            !isOnboardingVisible;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel_rounded,
                                      size: 35.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                GradientText(
                                  "Build Habits\n& Get Better",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  colors: const [
                                    Color(0xCBB0D9F1),
                                    Color(0xFF8E6AE4),
                                  ],
                                ),
                                const Text(
                                  "Practice daily habits made by\nhighly productive\npeople like Elon Musk and more!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 12.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200.0,
                            width: 300.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      canShowSignInPopUp = !canShowSignInPopUp;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 150.0,
                                    width: 200.0,
                                    child: Stack(
                                      children: const [
                                        RiveAnimation.asset(
                                          'assets/rive_assets/button.riv',
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Positioned(
                                          bottom: 65.0,
                                          right: 40.0,
                                          child: Text(
                                            "> Start using the app",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Twitterchirp_Bold",
                                              fontSize: 13.0,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Join other users now, to compete, learn\n and share a very unique experience.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 12.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: canShowSignInPopUp,
              child: ShowUpAnimation(
                animationDuration: const Duration(milliseconds: 200),
                delayStart: const Duration(milliseconds: 0),
                curve: Curves.decelerate,
                direction: Direction.vertical,
                offset: 0.2,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: (height - 100.0),
                    width: (width - 30.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: (height - 150.0),
                                width: (width - 30.0),
                                child: Blur(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  blur: 50,
                                  colorOpacity: 0.0,
                                  blurColor: Colors.white,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: (height - 150.0),
                            width: (width - 30.0),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(189, 255, 255, 255),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(96, 0, 0, 0),
                                  spreadRadius: 10,
                                  blurRadius: 25.0,
                                  offset: Offset(
                                      2, 9), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  width: (width - 70.0),
                                  child: const Text(
                                    "Access multiple prebuilt habits and time\nmanagement technics. Learn and discover the set of technics we have for you.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                      100.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: username,
                                    decoration: InputDecoration(
                                      icon: Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          color:
                                              Color.fromARGB(27, 59, 15, 206),
                                        ),
                                        child: const Icon(
                                          Icons.email_outlined,
                                          color:
                                              Color.fromARGB(255, 165, 99, 215),
                                        ),
                                      ),
                                      labelText: "E-mail",
                                      labelStyle: const TextStyle(
                                        color: Color(0xFFB4B4B4),
                                        fontFamily: "Twitterchirp",
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                      100.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: username,
                                    decoration: InputDecoration(
                                      icon: Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          color:
                                              Color.fromARGB(27, 59, 15, 206),
                                        ),
                                        child: const Icon(
                                          Icons.password_outlined,
                                          color:
                                              Color.fromARGB(255, 165, 99, 215),
                                        ),
                                      ),
                                      labelText: "Password",
                                      labelStyle: const TextStyle(
                                        color: Color(0xFFB4B4B4),
                                        fontFamily: "Twitterchirp",
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SignInButton(),
                                const Center(
                                  child: Text(
                                    "Or",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "Sign up with Google or Facebook",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    height: 100.0,
                                    width: 200.0,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  168, 42, 209, 246),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(360.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  spreadRadius: -13,
                                                  blurRadius: 30.0,
                                                  offset: Offset(2,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.facebook,
                                                size: 35.0,
                                              ),
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  168, 255, 255, 255),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(360.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  spreadRadius: -13,
                                                  blurRadius: 30.0,
                                                  offset: Offset(2,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: SizedBox(
                                                width: 35.0,
                                                child: Image.asset(
                                                    "assets/images/google.png"),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  spreadRadius: -20,
                                  blurRadius: 30.0,
                                  offset: Offset(
                                      2, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 60.0,
                            height: 60.0,
                            child: Stack(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(360.0),
                                    ),
                                    child: Container(
                                      color: Colors.black,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        canShowSignInPopUp =
                                            !canShowSignInPopUp;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel_rounded,
                                      size: 35.0,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
