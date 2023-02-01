import 'dart:math';

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/shared/static/three_d_objects.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../widgets/charts/stacked_chart.dart';
import 'background_animation.dart';

class ChartAndDescription extends StatefulWidget {
  const ChartAndDescription({Key? key}) : super(key: key);

  @override
  State<ChartAndDescription> createState() => _ChartAndDescriptionState();
}

class _ChartAndDescriptionState extends State<ChartAndDescription> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final random = Random();
    return Container(
      height: 500,
      padding: const EdgeInsets.only(top: 90.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        color: Colors.black,
      ),
      child: Stack(
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
          const Positioned(
            top: 50,
            child: StackedChart(),
          ),
          Positioned(
            top: 50,
            child: Container(
              color: Colors.white.withOpacity(0.0),
              width: 250.0,
              height: 250.0,
            ),
          ),
          Positioned(
            top: 0.0,
            right: 20.0,
            child: isTap
                ? ShowUpAnimation(
                    animationDuration: const Duration(milliseconds: 190),
                    curve: Curves.decelerate,
                    direction: Direction.vertical,
                    offset: 0.6,
                    child: SizedBox(
                      height: 80.0,
                      width: 200.0,
                      child: AnimatedAlign(
                        alignment: Alignment.bottomRight,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.bounceOut,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 50.0,
                              width: 150.0,
                              child: Blur(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                blur: 5,
                                colorOpacity: 0.5,
                                blurColor: Color(0xFF696969),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                              width: 90.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(CupertinoIcons.share,
                                      color: Colors.white, size: 20.0),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(),
          ),
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/bill-gate.png"),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    height: 90,
                    width: (width - 80),
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
                            // color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(threeDObjects[
                                  random.nextInt(threeDObjects.length)]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            // color: Colors.green,
                            child: const Center(
                                child: Text(
                              "Bill Gates's Daily Routine has a success rate of 12%. So be focused and good luck!",
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
            ),
          ),
        ],
      ),
    );
  }
}
