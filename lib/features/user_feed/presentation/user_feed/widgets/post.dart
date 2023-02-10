import 'dart:math';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v1/circle_avatar.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_line.dart';
import 'package:habit_master/shared/static/colors.dart';
import 'package:habit_master/shared/static/images.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final random = Random();
    final color = colors[random.nextInt(colors.length)];
    final avatar = avatars[random.nextInt(avatars.length)];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: width,
        height: (220.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: width,
                height: (200.0),
                child: Blur(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  blur: 60,
                  colorOpacity: 0.1,
                  blurColor: color.withOpacity(0.1),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 200.0,
                    width: (width - 20),
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 200.0,
                          width: (width - 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sideLine(color, height: 170),
                              SizedBox(
                                  height: 200.0,
                                  width: (width - 80),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 40.0,
                                            width: 150.0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 35.0,
                                                  width: 35.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: color,
                                                      width: 1.0,
                                                      style: BorderStyle.solid,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(avatar),
                                                    ),
                                                  ),
                                                ),
                                                const Text("Erina Klint",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 5.0,
                                              right: 5.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: color.withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Motivational Quote",
                                                style: TextStyle(
                                                  color: color,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 140.0,
                                        width: (width - 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "A Cubit is similar to Bloc but has no notion of events and relies on methods to emit new states. Every Cubit requires an initial state which will  state getter.",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: SizedBox(
                                                height: 60.0,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 60.0,
                                                      width: 180.0,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20.0),
                                                            child: Text(
                                                              "Liked by",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 60.0,
                                                            width: 100.0,
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  top: 25.0,
                                                                  left: 10.0,
                                                                  child:
                                                                      tinyCircleAvatar(
                                                                    avatars[random
                                                                        .nextInt(
                                                                            avatars.length)],
                                                                    const [
                                                                      Color.fromARGB(
                                                                          255,
                                                                          254,
                                                                          169,
                                                                          255),
                                                                      Color.fromARGB(
                                                                          255,
                                                                          254,
                                                                          169,
                                                                          255),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  top: 25.0,
                                                                  left: 30.0,
                                                                  child:
                                                                      tinyCircleAvatar(
                                                                    avatars[random
                                                                        .nextInt(
                                                                            avatars.length)],
                                                                    const [
                                                                      Color.fromARGB(
                                                                          255,
                                                                          169,
                                                                          218,
                                                                          255),
                                                                      Color.fromARGB(
                                                                          255,
                                                                          183,
                                                                          169,
                                                                          255),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    top: 25.0,
                                                                    left: 50.0,
                                                                    child: tinyCircleAvatar(
                                                                        avatars[
                                                                            random.nextInt(avatars.length)],
                                                                        const [
                                                                          Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              228,
                                                                              169),
                                                                          Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              211,
                                                                              169),
                                                                        ])),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 60.0,
                                                        width: 100.0,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          20.0),
                                                              child: IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon:
                                                                    const Icon(
                                                                  CupertinoIcons
                                                                      .hand_thumbsup_fill,
                                                                  size: 20.0,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          22.0),
                                                              child: IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon:
                                                                    const Icon(
                                                                  CupertinoIcons
                                                                      .hand_thumbsdown_fill,
                                                                  size: 20.0,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 25.0,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: color,
                      ),
                      child: const Center(
                        child: Text(
                          "Ben Matt",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Twitterchirp",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .slideY(
                          begin: -0.4,
                          duration: const Duration(milliseconds: 400),
                        )
                        .then()
                        .slide(
                          begin: const Offset(-0.2, 0),
                          duration: const Duration(milliseconds: 700),
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
