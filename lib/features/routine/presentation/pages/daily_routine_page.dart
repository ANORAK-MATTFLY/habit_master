import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:habit_master/features/routine/presentation/widgets/charts/stacked_chart.dart';

class DailyRoutine extends StatefulWidget {
  const DailyRoutine({Key? key}) : super(key: key);

  @override
  _DailyRoutineState createState() => _DailyRoutineState();
}

class _DailyRoutineState extends State<DailyRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        leading: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0x42FFFFFF),
            borderRadius: const BorderRadius.all(
              Radius.circular(360),
            ),
            border: Border.all(
                color: const Color(0xFFFFFFFF),
                style: BorderStyle.solid,
                width: 0.4),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              iconSize: 12.0,
            ),
          ),
        ),
        actions: [
          Container(
            height: 40.0,
            width: 40.0,
            margin: const EdgeInsets.only(top: 15, right: 20),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(360))),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/images/elon-musk.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.only(top: 15, right: 20),
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(360))),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  AssetImage("assets/images/3d objects/Polyhedron.png"),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF03020C),
        child: Column(
          children: [
            Container(
              height: 500,
              padding: const EdgeInsets.only(top: 90.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                gradient: LinearGradient(
                    colors: [Color(0xFF11BDAF), Color(0xFF057996)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.8],
                    tileMode: TileMode.clamp),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 50,
                    child: SizedBox(
                      width: 250.0,
                      height: 250.0,
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
                  const Positioned(top: 50, child: StackedChart()),
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
                      child: Blur(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        blur: 10,
                        colorOpacity: 0.3,
                        blurColor: const Color(0xFF104141),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
