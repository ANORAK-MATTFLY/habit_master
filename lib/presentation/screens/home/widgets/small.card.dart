import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:habit_master/data/models/routine.model.dart';

class SmallCard extends StatefulWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  final random = Random();
  final images = [
    "assets/images/3d objects/Ball-2.png",
    "assets/images/3d objects/Cones.png",
    "assets/images/3d objects/Cube-2.png",
    "assets/images/3d objects/Polyhedron.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 30,
        children: celebritiesRoutines.map((routine) {
          final cardPositionIsOdd = celebritiesRoutines.indexOf(routine).isEven;
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: 140.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF747474),
                      style: BorderStyle.solid,
                      width: 0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cardPositionIsOdd
                          ? const Color(0xFF8044A3).withOpacity(0.2)
                          : const Color(0xFF2E75A9).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(2, 9),
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: cardPositionIsOdd
                          ? [
                              const Color(0xFF70F0D4).withOpacity(0.6),
                              const Color(0xFF4EBFF3).withOpacity(0.6),
                            ]
                          : [
                              const Color(0xFF1C628A).withOpacity(0.6),
                              const Color(0xFFB082E4).withOpacity(0.6)
                            ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: const [0.0, 0.8],
                      tileMode: TileMode.clamp),
                ),
              ),
              Positioned(
                right: 0.0,
                child: SizedBox(
                  width: 140.0,
                  height: 200.0,
                  child: Blur(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    blur: 10,
                    colorOpacity: 0.1,
                    blurColor: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                width: 140.0,
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    images[random.nextInt(images.length)],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            top: 2.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(360),
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                ),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage(routine.ownerImage!),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${routine.ownerName!}'s Daily Routine",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 12.0),
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      "8 habits - 12 tasks a day",
                      style: TextStyle(
                        fontFamily: "Twitterchirp",
                        color: Color(0xB7FFFFFF),
                        fontSize: 10.0,
                      ),
                    ),
                    // const SizedBox(height: 10.0),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: LinearProgressIndicator(
                          minHeight: 5.0,
                          value: 0.2,
                          color: Colors.white,
                          backgroundColor: Color(0xFF3B2D73),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }).toList());
  }
}
