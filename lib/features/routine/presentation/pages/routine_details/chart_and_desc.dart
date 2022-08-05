import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../widgets/charts/stacked_chart.dart';
import 'competition_screen/widgets/background_animation.dart';

class ChartAndDescription extends StatefulWidget {
  const ChartAndDescription({Key? key}) : super(key: key);

  @override
  State<ChartAndDescription> createState() => _ChartAndDescriptionState();
}

class _ChartAndDescriptionState extends State<ChartAndDescription> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
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
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(0.2),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30.0),
                ),
                border: Border.all(
                    color: const Color(0xFFBDBDBD),
                    style: BorderStyle.solid,
                    width: 0.1),
              ),
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: const Blur(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                blur: 10,
                colorOpacity: 0.3,
                blurColor: Color(0xFF104141),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30.0),
                ),
                border: Border.all(
                    color: const Color(0xFFBDBDBD),
                    style: BorderStyle.solid,
                    width: 0.1),
              ),
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Elon musk's daily routine",
                    style: TextStyle(
                      color: Color(0xFFDADADA),
                      fontFamily: "Twitterchirp_Bold",
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    "With success rate of 20% this routine will drastically increase your productivity, but remember consistency is the key, so good look!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp",
                        fontSize: 12.0),
                  )
                ],
              ),
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
          )
        ],
      ),
    );
  }
}
