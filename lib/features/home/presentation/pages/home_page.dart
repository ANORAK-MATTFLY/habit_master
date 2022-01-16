import 'dart:ui';
import 'package:habit_master/features/home/presentation/pages/widgets/small_card.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_master/shared/features/routine/widgets/circle.dart';
import 'package:intl/intl.dart';

import 'package:habit_master/features/home/presentation/pages/widgets/large_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    DateTime today = DateTime.now();
    final month = DateFormat("MMMM")
        .format(today)
        .split("")
        .sublist(0, 3)
        .join()
        .toUpperCase();

    final day = DateFormat('EEEE').format(today).toUpperCase();
    final dayNumber = today.day;

    return Scaffold(
      body: Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF03020C)),
          child: Stack(
            children: [
              Positioned(
                right: 80.0,
                top: 50.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Container(
                        color: const Color(0x2F88DA88).withOpacity(0.1),
                        height: 50.0,
                        width: 50.0)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                    color: const Color(0xFF32333B).withOpacity(0.1),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width),
              ),
              Stack(
                children: [
                  const Positioned(
                      right: 40.0,
                      top: 65.0,
                      child: SizedBox(height: 30, width: 30, child: Circle())),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "$day, $month $dayNumber",
                                style: const TextStyle(
                                  color: Color(0xB7FFFFFF),
                                  fontFamily: "Twitterchirp",
                                  fontSize: 12.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Habit Masters",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    // color: Colors.e
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 30.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(360.0),
                                            ),
                                            child: Container(
                                              height: 30.0,
                                              width: 30.0,
                                              color: const Color(0xFF393939)
                                                  .withOpacity(0.9),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    "assets/svg/search-icon.svg",
                                                    height: 12,
                                                    semanticsLabel:
                                                        'A red up arrow'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(360.0)),
                                          child: Container(
                                            height: 30.0,
                                            width: 30.0,
                                            color: const Color(0xFF393939)
                                                .withOpacity(0.9),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/svg/user-profile-icon.svg",
                                                  // color: Colors.red,
                                                  height: 12,
                                                  semanticsLabel:
                                                      'A red up arrow'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 310.0,
                        // color: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: const LargCard(),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Color(0xFF060C14),
                          ),
                          child: Center(
                            child: ListTile(
                              title: GradientText(
                                "CAN YOU PLEASE GIVE US A RATING?",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Twitterchirp_Bold",
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                colors: const [
                                  Color(0xCBB0D9F1),
                                  Color(0xFF8E6AE4),
                                ],
                              ),
                              subtitle: const Text(
                                " By doing so you will help us improve the app.",
                                style: TextStyle(
                                  color: Color(0xB7B9B8B8),
                                  fontFamily: "Twitterchirp",
                                  fontSize: 10.0,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              trailing: Container(
                                height: 35.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(360.0),
                                  ),
                                  border: Border.all(
                                      color: const Color(0xFF3F3F3F),
                                      style: BorderStyle.solid,
                                      width: 0.4),
                                ),
                                child: Center(
                                  child: SvgPicture.asset("assets/svg/link.svg",
                                      height: 12,
                                      color: const Color(0xFF807E7E),
                                      semanticsLabel: 'A red up arrow'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Flexible(
                          flex: 2,
                          // color: Colors.red,
                          // width: double.infinity,
                          // height: 270,
                          child: SmallCard()),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
