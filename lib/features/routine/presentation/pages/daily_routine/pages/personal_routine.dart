import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/pages/daily_routine_page.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/pages/wecome_page.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v1/simmer_loader.dart';
import 'package:habit_master/shared/widgets/dynamic_island.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PersonalRoutinePage extends StatefulWidget {
  const PersonalRoutinePage({Key? key}) : super(key: key);

  @override
  State<PersonalRoutinePage> createState() => _PersonalRoutinePageState();
}

class _PersonalRoutinePageState extends State<PersonalRoutinePage> {
  bool timerIsStopped = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final User? userInfo = serviceLocator<IdentityApi>().getAuthenticatedUser();
    final routineRepo = serviceLocator<RoutineRepository>();
    final authorRepo = serviceLocator<AuthorRepository>();
    final timerControllerCubit = context.read<TimerControllerCubit>();
    timerControllerCubit.updateState();

    return userInfo == null
        ? const WelcomePage()
        : Scaffold(
            backgroundColor: Colors.black,
            body: FutureBuilder<Author>(
                future: authorRepo.getAuthorById(userInfo.uid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const WelcomePage();
                  }

                  if (snapshot.hasData) {
                    final Author author = snapshot.data!;

                    return Stack(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          color: Colors.black,
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              height: (height - 120),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        onPlay: (controller) =>
                                            controller.repeat(),
                                      )
                                      .shimmer(
                                        color: const Color.fromARGB(
                                            158, 255, 255, 255),
                                        duration: 3000.ms,
                                      ),
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
                                  FutureBuilder<Routine>(
                                    future: routineRepo
                                        .getOneRoutine(author.subscribedTo!),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const ShimmerLoader();
                                      }

                                      final Routine routine = snapshot.data!;
                                      return GestureDetector(
                                        onTap: () async {
                                          context
                                              .read<RoutineCubit>()
                                              .updateState(routine);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DailyRoutinePage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          height: 90,
                                          width: (width - 40),
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 19, 196, 167),
                                                  Color.fromARGB(
                                                      255, 56, 246, 155),
                                                ],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [0.0, 0.9],
                                                tileMode: TileMode.clamp),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        237, 120, 255, 239)
                                                    .withOpacity(0.2),
                                                spreadRadius: 8,
                                                blurRadius: 30,
                                                offset: const Offset(2, 9),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 100.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: AssetImage(routine
                                                        .authorProfilePicture!),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Center(
                                                      child: Text(
                                                    "You've subscribed to this Daily Routine",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          "Twitterchirp",
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                            .animate()
                                            .fadeIn(duration: 500.milliseconds),
                                      );
                                    },
                                  ),
                                  FutureBuilder<Routine>(
                                      future:
                                          routineRepo.getOneRoutine(author.id!),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return const ShimmerLoader();
                                        }

                                        final Routine routine = snapshot.data!;
                                        return GestureDetector(
                                          onTap: () async {
                                            context
                                                .read<RoutineCubit>()
                                                .updateState(routine);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DailyRoutinePage(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            height: 90,
                                            width: (width - 40),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        231, 255, 250, 115),
                                                    Color.fromARGB(
                                                        255, 255, 131, 131),
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0.0, 0.8],
                                                  tileMode: TileMode.clamp),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 255, 131, 131)
                                                      .withOpacity(0.2),
                                                  spreadRadius: 8,
                                                  blurRadius: 30,
                                                  offset: const Offset(2,
                                                      9), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 80.0,
                                                  width: 80.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(author
                                                          .authorProfilePicture!),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    // color: Colors.green,
                                                    child: const Center(
                                                        child: Text(
                                                      "Start my daily routine now!",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Twitterchirp",
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        // overflow: TextOverflow.ellipsis,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animate().fadeIn(
                                              duration: 500.milliseconds),
                                        );
                                      }),
                                  Container(
                                    height: 30.0,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 0, 251, 255),
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
                                            onPlay: (controller) =>
                                                controller.repeat(),
                                          )
                                          .shimmer(
                                              color: const Color.fromARGB(
                                                  158, 255, 255, 255),
                                              duration: 3000.ms),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<StreamTimerBLoc, Stream<String>?>(
                            buildWhen: (previous, current) {
                          return previous != current;
                        }, builder: (context, state) {
                          if (state == null) {
                            return const Center();
                          }
                          if (timerControllerCubit.state == true) {
                            state.take(0);
                            return const Center();
                          }
                          return StreamBuilder<String>(
                              stream: state.takeWhile(
                                  (_) => timerControllerCubit.state == false),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center();
                                }

                                if (snapshot.data == "59") {
                                  context
                                      .read<MinutesCounterCubit>()
                                      .updateState();
                                }
                                if (context.read<MinutesCounterCubit>().state >=
                                    context.read<MinutesCubit>().state) {
                                  timerControllerCubit.updateState();
                                  return const Center();
                                }

                                final String remainingTime = snapshot.data!;
                                return DynamicIsland(
                                    remainingTime:
                                        "${context.read<MinutesCounterCubit>().state} : $remainingTime");
                              });
                        }),
                      ],
                    );
                  }
                  return const Center();
                }),
          );
  }
}
