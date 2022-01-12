import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:habit_master/features/home/presentation/pages/widgets/card.dart';

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          // color: Colors.e
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(360.0),
                                  ),
                                  child: Container(
                                    height: 30.0,
                                    width: 30.0,
                                    color: const Color(0xFF393939),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/svg/search-icon.svg",
                                          // color: Colors.red,
                                          height: 12,
                                          semanticsLabel: 'A red up arrow'),
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
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF393939),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/svg/user-profile-icon.svg",
                                        // color: Colors.red,
                                        height: 12,
                                        semanticsLabel: 'A red up arrow'),
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
              height: 300.0,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: const PrebuiltCard(),
            ),
            Flexible(
              flex: 3,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
