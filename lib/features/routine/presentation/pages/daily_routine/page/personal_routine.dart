import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/shared/static/three_d_objects.dart';

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
    final random = Random();
    final authorImage = "assets/images/bill-gate.png";

    return Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Center(
          child: Container(
            height: 500.0,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30.0,
                  width: 300.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 132, 22, 211),
                          Color.fromARGB(255, 116, 255, 216),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 0.8],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "My Daily routine you've subscribed to",
                      style: TextStyle(
                        fontFamily: "Twitterchirp",
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      height: 90,
                      width: (width - 20),
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(232, 181, 106, 225),
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
                            decoration: BoxDecoration(
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
                                "'s Daily Routine has a success rate of 12%. So be focused and good luck!",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 213, 213, 213),
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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      height: 90,
                      width: (width - 20),
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(232, 181, 106, 225),
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
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    "assets/images/avatars/av17.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              // color: Colors.green,
                              child: const Center(
                                  child: Text(
                                "'s Daily Routine has a success rate of 12%. So be focused and good luck!",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 213, 213, 213),
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
              ],
            ),
          ),
        ));
  }
}
