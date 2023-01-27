import 'package:flutter/material.dart';

import '../widgets/daily_routine/expantion_item.dart';
import '../widgets/daily_routine/progress.dart';

import 'chart_and_desc.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  _DailyRoutinePageState createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  bool isTap = false;
  bool canMove = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          GestureDetector(
            onTap: () {
              setState(() {
                isTap = !isTap;
              });
            },
            child: Container(
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
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 7, 3, 15),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 430,
                width: (MediaQuery.of(context).size.width),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ExpandedItemList(
                        title: "Start your Morning Routine",
                        progressRatio: progress(
                          "0/3",
                          const Color.fromARGB(255, 255, 230, 0),
                        ),
                        color: const Color.fromARGB(255, 255, 230, 0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ExpandedItemList(
                        title: "Kickoff your Afternoon!",
                        progressRatio: progress(
                          "0/4",
                          Color.fromARGB(255, 246, 149, 255),
                        ),
                        color: Color.fromARGB(255, 246, 149, 255),
                      ),
                    ),
                    ExpandedItemList(
                      title: "Finish your day style!",
                      progressRatio: progress(
                        "0/3",
                        const Color.fromARGB(255, 0, 255, 247),
                      ),
                      color: const Color.fromARGB(255, 0, 255, 247),
                    ),
                  ],
                ),
              ),
            ),
            const ChartAndDescription(),
          ],
        ),
      ),
    );
  }
}
