import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/features/habits/presentation/pages/home_page.dart';
import 'package:habit_master/features/habits/presentation/pages/profile_page.dart';

class SuspendedBottomAppBar extends StatefulWidget {
  const SuspendedBottomAppBar({Key? key}) : super(key: key);

  @override
  State<SuspendedBottomAppBar> createState() => _SuspendedBottomAppBarState();
}

class _SuspendedBottomAppBarState extends State<SuspendedBottomAppBar> {
  int index = 0;
  double navbarIndicatorPosition = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final screens = [
      const HomePage(),
      const ProfilePage(),
      const ProfilePage(),
      const ProfilePage(),
    ];
    return Material(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            screens[index],
            Positioned(
              bottom: 0.0,
              child: Container(
                height: 60.0,
                width: (width),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(34, 130, 12, 204),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: SizedBox(
                height: 60.0,
                width: (width),
                child: const Blur(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  blur: 60,
                  colorOpacity: 0.0,
                  blurColor: Color.fromARGB(0, 62, 13, 92),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: SizedBox(
                height: 60,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Column(
                        children: [
                          Visibility(
                            visible: index == 0,
                            child: Container(
                              height: 5.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 161, 20, 255),
                                      Color.fromARGB(255, 86, 38, 170),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 0.8],
                                    tileMode: TileMode.clamp),
                              ),
                            ).animate().slideX(
                                  begin: navbarIndicatorPosition,
                                  duration: 500.milliseconds,
                                ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (index == 1) {
                                  navbarIndicatorPosition = 2;
                                }
                                if (index == 2) {
                                  navbarIndicatorPosition = 4;
                                }
                                if (index == 3) {
                                  navbarIndicatorPosition = 7;
                                }
                                index = 0;
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.house_fill,
                              size: 25.0,
                              color: index == 0
                                  ? const Color.fromARGB(184, 232, 170, 255)
                                  : const Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Column(
                        children: [
                          Visibility(
                            visible: index == 1,
                            child: Container(
                              height: 5.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 161, 20, 255),
                                      Color.fromARGB(255, 86, 38, 170),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 0.8],
                                    tileMode: TileMode.clamp),
                              ),
                            ).animate().slideX(
                                  begin: navbarIndicatorPosition,
                                  duration: 500.milliseconds,
                                ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (index < 1) {
                                  navbarIndicatorPosition = -1;
                                }
                                if (index == 2) {
                                  navbarIndicatorPosition = 1;
                                }
                                if (index == 3) {
                                  navbarIndicatorPosition = 4;
                                }
                                index = 1;
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.square_grid_2x2_fill,
                              size: 25.0,
                              color: index == 1
                                  ? const Color.fromARGB(184, 232, 170, 255)
                                  : const Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Column(
                        children: [
                          Visibility(
                            visible: index == 2,
                            child: Container(
                              height: 5.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 161, 20, 255),
                                      Color.fromARGB(255, 86, 38, 170),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 0.8],
                                    tileMode: TileMode.clamp),
                              ),
                            ).animate().slideX(
                                  begin: navbarIndicatorPosition,
                                  duration: 500.milliseconds,
                                ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (index > 2) {
                                  navbarIndicatorPosition = 2;
                                }
                                if (index == 1) {
                                  navbarIndicatorPosition = -1;
                                }
                                if (index == 0) {
                                  navbarIndicatorPosition = -4;
                                }
                                index = 2;
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.square_stack_3d_up_fill,
                              size: 25.0,
                              color: index == 2
                                  ? const Color.fromARGB(184, 232, 170, 255)
                                  : const Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Column(
                        children: [
                          Visibility(
                            visible: index == 3,
                            child: Container(
                              height: 5.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 161, 20, 255),
                                      Color.fromARGB(255, 86, 38, 170),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 0.8],
                                    tileMode: TileMode.clamp),
                              ),
                            ).animate().slideX(
                                  begin: navbarIndicatorPosition,
                                  duration: 500.milliseconds,
                                ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (index == 2) {
                                navbarIndicatorPosition = -2;
                              }
                              if (index == 1) {
                                navbarIndicatorPosition = -4;
                              }
                              if (index == 0) {
                                navbarIndicatorPosition = -6;
                              }
                              setState(() {
                                index = 3;
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.bell_fill,
                              size: 25.0,
                              color: index == 3
                                  ? const Color.fromARGB(184, 232, 170, 255)
                                  : const Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
