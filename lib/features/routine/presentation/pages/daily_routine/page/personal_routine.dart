import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_author.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_author.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/page/daily_routine_page.dart';
import 'package:habit_master/shared/static/images.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../auth/api/identity_api.dart';

class PersonalRoutinePage extends StatefulWidget {
  const PersonalRoutinePage({Key? key}) : super(key: key);

  @override
  State<PersonalRoutinePage> createState() => _PersonalRoutinePageState();
}

class _PersonalRoutinePageState extends State<PersonalRoutinePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const authorImage = "assets/images/bill-gate.png";
    final random = Random();

    return Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Center(
          child: Container(
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: (height - 120),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GradientText(
                  "Ready for a productive day?",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp_Bold",
                    fontSize: 40.0,
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
                        duration: 3000.ms),
                const Text(
                  "Make your pick, and knockout some habits!",
                  style: TextStyle(
                    fontFamily: "Twitterchirp",
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      height: 90,
                      width: (width - 40),
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(232, 181, 106, 225),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 19, 196, 167),
                              Color.fromARGB(255, 56, 246, 155),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 0.9],
                            tileMode: TileMode.clamp),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(237, 120, 255, 239)
                                .withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 30,
                            offset: const Offset(
                                2, 9), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: const BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(authorImage),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              // color: Colors.green,
                              child: const Center(
                                  child: Text(
                                "You've subscribed to this Daily Routine",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Twitterchirp",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 500.milliseconds),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final userInfo =
                            await IdentityApi().getAuthenticatedUser();
                        final random = Random();
                        final avatar = avatars[random.nextInt(avatars.length)];
                        if (userInfo != null) {
                          final Author author = Author(
                            authorProfilePicture: avatar,
                            authorName: userInfo.displayName,
                            id: userInfo.uid,
                            type: "costumer",
                          );

                          // ignore: use_build_context_synchronously
                          context.read<CreateAuthorBlocLogic>().add(
                                CreateAuthorAction(author: author),
                              );

                          final routine = await RoutineRepository()
                              .getOneRoutine(author.id!);

                          // ignore: use_build_context_synchronously
                          context.read<HabitCubit>().updateState(routine);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DailyRoutinePage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        height: 90,
                        width: (width - 40),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(231, 255, 250, 115),
                                Color.fromARGB(255, 255, 131, 131),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.0, 0.8],
                              tileMode: TileMode.clamp),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 255, 131, 131)
                                  .withOpacity(0.2),
                              spreadRadius: 8,
                              blurRadius: 30,
                              offset: const Offset(
                                  2, 9), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(360.0),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      avatars[random.nextInt(avatars.length)]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                // color: Colors.green,
                                child: const Center(
                                    child: Text(
                                  "Start my daily routine now!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 500.milliseconds),
                    ),
                  ],
                ),
                Container(
                  height: 30.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 251, 255),
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: GradientText(
                      "Discover",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
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
                            duration: 3000.ms),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
