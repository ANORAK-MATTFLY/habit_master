import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF0C051D),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              "You are now on timer mode",
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Twitterchirp_Bold",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                decoration: TextDecoration.none,
              ),
              colors: const [
                Color(0xCBC4E2F3),
                Color(0xFF7D4EEB),
              ],
            ),
            Container(
              height: 30.0,
              width: 90,
              decoration: const BoxDecoration(
                color: Color(0xFF8D8D8D),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  "45 min sprint",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp_Bold",
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            CircularPercentIndicator(
              radius: 130.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 10.0,
              circularStrokeCap: CircularStrokeCap.round,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xFF22FFB5).withOpacity(0.4),
                  const Color(0xFF5D68FA).withOpacity(0.9),
                  const Color(0xFFAF07AF).withOpacity(0.9),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.0, 0.5, 0.8],
                tileMode: TileMode.clamp,
              ),
              percent: 0.9,
              center: const Center(
                child: Text(
                  "45:00",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 40.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Go back",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp_Bold",
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
