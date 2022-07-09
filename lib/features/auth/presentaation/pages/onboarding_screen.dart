import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../shared/bloc/onboarding_cubit.dart';
import '../bloc/sign_in_cubit.dart';
import '../widgets/sign_in_popup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
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
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _canDisplaySignInScreen = BlocProvider.of<SignInCubit>(context);

    return BlocBuilder<SignInCubit, bool>(
      bloc: _canDisplaySignInScreen,
      builder: (context, _canDisplaySignInScreen) => SlideTransition(
        transformHitTests: true,
        position: _offsetAnimation,
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
                          margin:
                              const EdgeInsets.only(left: 15.0, bottom: 0.0),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                visible: _canDisplaySignInScreen,
                child: const SignInPopup(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
