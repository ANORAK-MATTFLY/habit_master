import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 150.0),
      height: height,
      width: width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GradientText(
            "Welcome to habit master!",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Twitterchirp_Bold",
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              overflow: TextOverflow.clip,
            ),
            colors: const [
              Color.fromARGB(202, 43, 255, 184),
              Color.fromARGB(255, 138, 255, 198),
            ],
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(
                color: const Color.fromARGB(158, 255, 255, 255),
                duration: 3000.ms,
              ),
          const Text(
            "Please login before you use your daily routine",
            style: TextStyle(
              fontFamily: "Twitterchirp",
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final isAuthenticated =
                  await serviceLocator<IdentityApi>().isAuthenticated();
              if (!isAuthenticated) {
                // ignore: use_build_context_synchronously
                context.read<OnboardingCubit>().updateState();
                return;
              }
            },
            child: Container(
              height: 30.0,
              width: 200.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 227, 227),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: const Center(
                child: Text("Login"),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  color: const Color.fromARGB(158, 255, 255, 255),
                  duration: 3000.ms,
                ),
          ),
        ],
      ),
    );
  }
}
