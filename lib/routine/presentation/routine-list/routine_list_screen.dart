import 'dart:ui';
import 'package:habit_master/authentication/presentation/login/login_screen.dart';
import 'package:habit_master/routine/presentation/routine-list/widgets/large_card.dart';
import 'package:habit_master/routine/presentation/routine-list/widgets/small_card.dart';
import 'package:habit_master/shared/presentation/circle.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


// TODO: Separate RoutineListScreen with HomeScreen

class RoutineListScreen extends StatefulWidget {
  const RoutineListScreen({Key? key}) : super(key: key);

  @override
  _RoutineListScreenState createState() => _RoutineListScreenState();
}

class _RoutineListScreenState extends State<RoutineListScreen> {
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

    final listOfCard = [
      Container(
        height: 310.0,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: const LargCard(),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
      const Flexible(flex: 2, child: SmallCard()),
    ];

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: const Color(0xFF0C051D),
            floating: true,
            snap: true,
            toolbarHeight: 100.0,
            actions: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: 80.0,
                      top: 40.0,
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
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    const Positioned(
                        right: 35.0,
                        top: 55.0,
                        child:
                            SizedBox(height: 30, width: 30, child: Circle())),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
                                        );
                                      },
                                      child: ClipRRect(
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
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        body: Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF0C051D)),
          child: ListView.separated(
            itemCount: listOfCard.length,
            itemBuilder: (BuildContext context, int index) {
              final section = listOfCard[index];
              return section;
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10.0),
          ),
        ),
      ),
    );
  }
}
