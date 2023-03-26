import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minitutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_habit_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import '../../features/routine/presentation/pages/daily_routine/bloc/bloc_event/time_stream_event.dart';

class DynamicIsland extends StatefulWidget {
  const DynamicIsland({
    Key? key,
    required this.remainingTime,
  }) : super(key: key);

  final String remainingTime;

  @override
  State<DynamicIsland> createState() => _DynamicIslandState();
}

class _DynamicIslandState extends State<DynamicIsland> {
  bool taped = false;
  bool showTimer = true;
  bool showLockIcon = false;
  bool minimize = false;
  bool showDynamic = true;
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final habitTimer = context.read<HabitTimerCubit>();

    final time = habitTimer.state!.duration!.split("-");

    final habitDuration = int.parse(time[0]);

    final percent = ((int.parse(widget.remainingTime.substring(0, 2)) * 100) /
            habitDuration)
        .ceil()
        .toString();

    final ratio = (habitDuration / habitDuration).ceil().toString();
    return Visibility(
      visible: showDynamic,
      child: SizedBox(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      taped = !taped;
                      showLockIcon = !showLockIcon;
                    });
                  },
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 60.0,
                      width: minimize == true ? 50 : (width - 20),
                      decoration: BoxDecoration(
                        // color: Colors.yellow,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),

                        gradient: minimize == false
                            ? const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 185, 86, 255),
                                  Color.fromARGB(255, 255, 185, 209),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.8],
                                tileMode: TileMode.clamp,
                              )
                            : const LinearGradient(
                                colors: [
                                  Color.fromARGB(233, 26, 26, 26),
                                  Color.fromARGB(191, 26, 26, 26),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.0,
                                  0.8,
                                ],
                                tileMode: TileMode.clamp,
                              ),
                      ),
                      child: Visibility(
                        visible: minimize,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                // taped = true;
                                showTimer = true;
                                // showLockIcon = false;
                                minimize = !minimize;
                              });
                            },
                            icon: const Icon(
                              CupertinoIcons.fullscreen,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Visibility(
                visible: showTimer,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          height: 50.0,
                          width: 200.0,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.remainingTime,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 171, 255, 173),
                                  fontFamily: "Twitterchirp",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Container(
                                height: 35.0,
                                width: 70.0,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 24, 24, 24),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 70.0,
                                    width: 70.0,
                                    child: Lottie.asset(
                                      "assets/animations/timer_animations/timer3.json",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animate().flip(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDetails = !showDetails;
                            });
                          },
                          child: Container(
                              height: 50.0,
                              width: 120.0,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${habitDuration!} Minutes",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Text(
                                    "$percent %",
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 121, 255, 126),
                                      fontFamily: "Twitterchirp",
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              )).animate().fadeIn(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: taped,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 40.0,
                      width: (width - 80),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<TimerControllerCubit>()
                                    .updateState();
                                context
                                    .read<MinutesCounterCubit>()
                                    .setMinute(0);

                                showDynamic = false;
                                context.read<StreamTimerBLoc>().add(
                                      const TimeStreamEvent(minutes: 0),
                                    );
                              },
                              icon: const Icon(
                                CupertinoIcons.clear,
                                color: Color.fromARGB(255, 255, 128, 119),
                                size: 25.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  // taped = false;
                                  taped = false;
                                  minimize = !minimize;
                                  showTimer = false;
                                });
                              },
                              icon: const Icon(
                                CupertinoIcons.fullscreen_exit,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Visibility(
                visible: showDetails,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 40.0,
                      width: (width - 40),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total duration: ${habitTimer.state!.duration}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Twitterchirp",
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              "Steps: $ratio",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Twitterchirp",
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
