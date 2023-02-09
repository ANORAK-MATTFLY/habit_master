import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/auth/presentation/pages/authentication/widgets/v2/sign_in_button.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../../../../domain/logic/google_auth.dart';
import '../../bloc/cubit/sign_in_cubit.dart';

class SignInPopup extends StatefulWidget {
  const SignInPopup({Key? key}) : super(key: key);
  @override
  State<SignInPopup> createState() => _SignInPopupState();
}

class _SignInPopupState extends State<SignInPopup>
    with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1400), vsync: this)
      ..upperBound
      ..reverse(from: 1);

    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.5)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticIn),
    );
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SlideTransition(
      transformHitTests: true,
      position: _offsetAnimation,
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
                        child: const Blur(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          blur: 50,
                          colorOpacity: 0.0,
                          blurColor: Colors.white,
                          child: Padding(
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
                      color: Color.fromARGB(168, 255, 255, 255),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(96, 0, 0, 0),
                          spreadRadius: 10,
                          blurRadius: 25.0,
                          offset: Offset(2, 9), // changes position of shadow
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
                          width: (MediaQuery.of(context).size.width - 100.0),
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              icon: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  color: Color.fromARGB(27, 59, 15, 206),
                                ),
                                child: const Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 165, 99, 215),
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
                          width: (MediaQuery.of(context).size.width - 100.0),
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              icon: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  color: Color.fromARGB(27, 59, 15, 206),
                                ),
                                child: const Icon(
                                  Icons.password_outlined,
                                  color: Color.fromARGB(255, 165, 99, 215),
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
                            "Sign in with Google",
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
                          child: GestureDetector(
                            onTap: () async {
                              await GoogleAuth().loginWithGoogle();
                            },
                            child: Container(
                              height: 50.0,
                              width: 200.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    spreadRadius: -13,
                                    blurRadius: 30.0,
                                    offset: Offset(
                                        2, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 35.0,
                                    child:
                                        Image.asset("assets/images/google.png"),
                                  ),
                                  const Text(
                                    "Sign in with Google",
                                    style: TextStyle(fontSize: 13.0),
                                  )
                                ],
                              ),
                            ),
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
                          offset: Offset(2, 4), // changes position of shadow
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
                            onPressed: () =>
                                context.read<SignInCubit>().updateState(),
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
    );
  }
}
