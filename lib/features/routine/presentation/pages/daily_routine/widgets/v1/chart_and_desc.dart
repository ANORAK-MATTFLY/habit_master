import 'dart:math';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_remote_repository.dart';
import 'package:habit_master/shared/static/three_d_objects.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../../../../../../dep_injection.dart';
import '../v2/stacked_chart.dart';
import '../v2/background_animation.dart';

class ChartAndDescription extends StatefulWidget {
  final Routine routine;
  const ChartAndDescription({Key? key, required this.routine})
      : super(key: key);

  @override
  State<ChartAndDescription> createState() => _ChartAndDescriptionState();
}

class _ChartAndDescriptionState extends State<ChartAndDescription> {
  bool isTap = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final random = Random();
    final authorName = widget.routine.authorName!.length > 15
        ? widget.routine.authorName!.substring(0, 15)
        : widget.routine.authorName!;
    final userID = serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;
    final routine = widget.routine;
    print(routine.type);
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 0.0,
          child: SizedBox(
            width: 350.0,
            height: 350.0,
            child: BackgroundAnimation(),
          ),
        ),
        Positioned(
          top: 20,
          child: StackedChart(routine: routine),
        ),
        Positioned(
          bottom: 0.0,
          child: SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(widget.routine.authorProfilePicture!),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  height: 90,
                  width: (width - 80),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xB0246776).withOpacity(0.4),
                          const Color(0xFF855A9E).withOpacity(0.9),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.0, 0.8],
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
                        offset:
                            const Offset(2, 9), // changes position of shadow
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
                            image: AssetImage(threeDObjects[
                                random.nextInt(threeDObjects.length)]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: _isLoading == true
                            ? Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(175, 36, 215, 255)
                                          .withOpacity(0.4),
                                      const Color.fromARGB(172, 40, 231, 186)
                                          .withOpacity(0.4),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: const [0.0, 0.8],
                                    tileMode: TileMode.clamp,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(236, 19, 19, 19)
                                              .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          2, 9), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  height: 80.0,
                                  width: 80.0,
                                  child: Lottie.asset(
                                    "assets/animations/loading_2.json",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : userID == routine.authorID
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color.fromARGB(
                                                  175, 36, 215, 255)
                                              .withOpacity(0.4),
                                          const Color.fromARGB(
                                                  172, 40, 231, 186)
                                              .withOpacity(0.4),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        stops: const [0.0, 0.8],
                                        tileMode: TileMode.clamp,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  236, 19, 19, 19)
                                              .withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: const Offset(2,
                                              9), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Center(
                                            child: Text(
                                          "Please share your latest changes to help the community",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Twitterchirp",
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                        GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              _isLoading = true;
                                            });

                                            await serviceLocator<
                                                    RoutineRemoteRepository>()
                                                .routineRemoteMutations
                                                .sharePersonalRoutine(routine);

                                            setState(() {
                                              _isLoading = false;
                                            });
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 19, 215, 133),
                                              content: Text(
                                                "You've shared you're daily routine with the community!",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Twitterchirp",
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w900,
                                                  // overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              duration: Duration(seconds: 3),
                                            ));
                                          },
                                          child: Container(
                                            height: 30.0,
                                            width: 80.0,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      172, 40, 231, 186)
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                CupertinoIcons
                                                    .cloud_upload_fill,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Text(
                                      "$authorName's Daily Routine has a success rate of 12%. So be focused and good luck!",
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 213, 213, 213),
                                        fontFamily: "Twitterchirp",
                                        fontSize: 13.0,
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
          ),
        ),
      ],
    );
  }
}
