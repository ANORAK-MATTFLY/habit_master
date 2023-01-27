import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../routine/presentation/pages/routine_details/navigation.dart';

class LargeCard extends StatefulWidget {
  final authors;
  const LargeCard({Key? key, required this.authors}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _PrebuiltCardState createState() => _PrebuiltCardState();
}

class _PrebuiltCardState extends State<LargeCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.authors.length,
      itemBuilder: (BuildContext context, int index) {
        final routine = widget.authors[index];
        final authorName = routine.authorName!.toString().length > 9
            ? routine.authorName!.toString().substring(0, 9)
            : routine.authorName!;
        final cardPositionIsOdd = widget.authors.indexOf(routine).isEven;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RoutineNavigation(),
              ),
            );
          },
          child: Stack(
            children: [
              Positioned(
                bottom: 14.0,
                left: 15.0,
                child: Transform.rotate(
                  angle: -math.pi / -20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardPositionIsOdd
                          ? const Color(0xFF8044A3).withOpacity(0.2)
                          : const Color(0xFF60A9B3).withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    height: 100.0,
                    width: 155.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 170.0,
                  height: 270.0,
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
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
                            : const Color(0xFF1D9296).withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 8,
                        offset:
                            const Offset(2, 9), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: cardPositionIsOdd
                            ? [
                                const Color(0xB0246776).withOpacity(0.4),
                                const Color(0xFF855A9E).withOpacity(0.9),
                              ]
                            : [
                                const Color(0xFF207580).withOpacity(0.4),
                                const Color(0xFF2E75A9).withOpacity(0.9)
                              ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.0, 0.8],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 140.0,
                        width: 200.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                height: 180.0,
                                width: 180.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/3d objects/Ball-2.png"),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -5.0,
                                child: Container(
                                  height: 110.0,
                                  width: 110.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          routine.authorProfilePicture!),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Start $authorName's Daily Routine",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp_Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      const SizedBox(height: 12.0),
                      const Text(
                        "Used by 700+ people",
                        style: TextStyle(
                          fontFamily: "Twitterchirp",
                          color: Color(0xB7FFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "Recommended for people that work 80+ hours a week.",
                        style: TextStyle(
                          color: Color(0xB7FFFFFF),
                          fontFamily: "Twitterchirp",
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
