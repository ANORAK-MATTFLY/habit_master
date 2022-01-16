import 'package:flutter/material.dart';
import 'package:habit_master/shared/features/routine/models/routine.dart';

class SmallCard extends StatefulWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      shrinkWrap: true,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(celebritiesRoutines.length, (index) {
        final routine = celebritiesRoutines[index];
        final cardPositionIsOdd = celebritiesRoutines.indexOf(routine).isEven;
        return Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          // width: 200.0,
          height: 400.0,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                spreadRadius: 6,
                blurRadius: 8,
                offset: const Offset(2, 9), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
                colors: cardPositionIsOdd
                    ? [
                        const Color(0xFFBE46BE).withOpacity(0.4),
                        const Color(0xFF54D6CF).withOpacity(0.4),
                      ]
                    : [
                        const Color(0xFFF7B9F7).withOpacity(0.4),
                        const Color(0xFF6ACFCC).withOpacity(0.9)
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
                height: 80.0,
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
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(cardPositionIsOdd
                                ? "assets/images/3d objects/Cube-2.png"
                                : "assets/images/3d objects/Ball-2.png"),
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
                            backgroundImage: AssetImage(routine.ownerImage!),
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
        );
      }),
    );
  }
}
