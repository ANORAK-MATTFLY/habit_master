import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_master/shared/features/routine/models/routine.dart';
import 'package:habit_master/shared/features/routine/widgets/circle.dart';

class PrebuiltCard extends StatefulWidget {
  const PrebuiltCard({Key? key}) : super(key: key);
  @override
  _PrebuiltCardState createState() => _PrebuiltCardState();
}

class _PrebuiltCardState extends State<PrebuiltCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: routines.length,
      itemBuilder: (BuildContext context, int index) {
        final routine = routines[index];
        final cardPositionIsOdd = routines.indexOf(routine).isEven;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
              width: 190.0,
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                gradient: LinearGradient(
                    colors: cardPositionIsOdd
                        ? [
                            const Color(0xB0246776),
                            const Color(0xFF8044A3),
                          ]
                        : [const Color(0xFF207580), const Color(0xFF2E75A9)],
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
                          const Circle(),
                          Positioned(
                            bottom: -5.0,
                            child: Container(
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(routine.ownerImage!),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "${routine.ownerName!}'s Daily Routine",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    "Used by 700+ people",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Color(0xB7FFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "This is an advanced time management technique, recomended for people that work 80+ hours a week.",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: Color(0xB7FFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
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
              )),
        );
      },
    );
  }
}
