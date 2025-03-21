import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/shared/bloc/auth_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../../shared/bloc/onboarding_cubit.dart';
import '../bloc/cubit/sign_in_cubit.dart';
import '../widgets/v1/sign_in_popup.dart';

class AuthenticationPanel extends StatefulWidget {
  const AuthenticationPanel({Key? key}) : super(key: key);

  @override
  State<AuthenticationPanel> createState() => _AuthenticationPanelState();
}

class _AuthenticationPanelState extends State<AuthenticationPanel>
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
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.4)).animate(
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
    final canDisplaySignInScreen = BlocProvider.of<SignInCubit>(context);

    return BlocBuilder<SignInCubit, bool>(
      bloc: canDisplaySignInScreen,
      builder: (context, canDisplaySignInScreen) => SlideTransition(
        transformHitTests: true,
        position: _offsetAnimation,
        child: Stack(
          children: [
            SizedBox(
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
                              margin: const EdgeInsets.only(
                                  left: 15.0, bottom: 0.0),
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
                            child: const Blur(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              blur: 60,
                              colorOpacity: 0.0,
                              blurColor: Color.fromARGB(0, 255, 255, 255),
                              child: Padding(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () => context
                                              .read<OnboardingCubit>()
                                              .updateState(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => context
                                            .read<SignInCubit>()
                                            .updateState(),
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
                                                  "> Please login first",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Twitterchirp",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                    decoration:
                                                        TextDecoration.none,
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
                    visible: canDisplaySignInScreen,
                    child: const SignInPopup(),
                  ),
                ],
              ),
            ),
            StreamBuilder<bool>(
                stream: context.read<AuthCubit>().stream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center();
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    final isLoggingIn = snapshot.data!;
                    if (isLoggingIn == true) {
                      return Container(
                        color: Colors.white.withOpacity(0.8),
                        height: height,
                        width: width,
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            height: 300,
                            width: 300.0,
                            child: Column(
                              children: [
                                const Text(
                                  "Please wait...",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 20.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: 250.0,
                                  width: 250.0,
                                  child: Lottie.asset(
                                      "assets/animations/loading_2.json"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    final isLoggingIn = snapshot.data!;
                    if (isLoggingIn == true) {
                      return Container(
                        color: Colors.white.withOpacity(0.3),
                        height: height,
                        width: width,
                        child: Center(
                          child: SizedBox(
                            height: 200.0,
                            width: 200.0,
                            child: Lottie.asset(
                                "assets/animations/loading_animation_1.json"),
                          ),
                        ),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    final isLoggingIn = snapshot.data!;
                    if (isLoggingIn == true) {
                      return Container(
                        color: Colors.red,
                        height: 80.0,
                        width: 80.0,
                        child: Lottie.asset("name"),
                      );
                    }
                  }
                  return const Center();
                })
          ],
        ),
      ),
    );
  }
}
