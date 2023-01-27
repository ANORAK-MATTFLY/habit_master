import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:habit_master/features/routine/models/task_model.dart';

import 'chart_and_desc.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  _DailyRoutinePageState createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  double _height = 0.0;
  double _width = 0.0;
  double _lineWidth = 0.0;
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
        color: const Color(0xFF0C051D),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final TaskModel task = tasks[index];
                      return Column(
                        children: [
                          Stack(
                            children: [
                              ListTile(
                                leading: task.taskType != "chrono"
                                    ? Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          AnimatedContainer(
                                            key: Key(task.taskID!),
                                            height: _height,
                                            width: _width,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.fastOutSlowIn,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFFA41BC),
                                                    Color(0xCBA8B2EE),
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0.0, 0.9],
                                                  tileMode: TileMode.clamp),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: _width > 0
                                                ? const Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 15.0,
                                                    ),
                                                  )
                                                : const Center(),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: OutlineGradientButton(
                                              onTap: () {
                                                setState(() {
                                                  {
                                                    _lineWidth =
                                                        task.isDone == true
                                                            ? 0.0
                                                            : 250.0;
                                                    task.isDone = !task.isDone!;
                                                    _width = task.isDone == true
                                                        ? 20.0
                                                        : 0.0;
                                                    _height =
                                                        task.isDone == true
                                                            ? 20.0
                                                            : 0.0;
                                                  }
                                                });
                                              },
                                              strokeWidth: 2,
                                              radius: const Radius.circular(5),
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFF9F56DA),
                                                    Color(0xCBA8B2EE),
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0.0, 0.9],
                                                  tileMode: TileMode.clamp),
                                              child: const Center(),
                                            ),
                                          ),
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         const TimerPage(),
                                          //   ),
                                          // );
                                        },
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularPercentIndicator(
                                            arcType: ArcType.FULL,
                                            radius: 20.0,
                                            animation: true,
                                            animationDuration: 1200,
                                            lineWidth: 2.0,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            arcBackgroundColor: Colors.black,
                                            percent: 0.5,
                                            linearGradient: LinearGradient(
                                              colors: [
                                                const Color(0xFFF100DD)
                                                    .withOpacity(0.4),
                                                const Color(0xFF6C53FA)
                                                    .withOpacity(0.9),
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              stops: const [0.0, 0.8],
                                              tileMode: TileMode.clamp,
                                            ),
                                            center: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 30.0,
                                                  width: 30.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(360),
                                                    ),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFFF7438E),
                                                          Color(0xCBA8EEEE),
                                                        ],
                                                        begin:
                                                            Alignment.topRight,
                                                        end: Alignment
                                                            .bottomLeft,
                                                        stops: [0.0, 0.9],
                                                        tileMode:
                                                            TileMode.clamp),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Blur(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20.0),
                                                    ),
                                                    blur: 5,
                                                    colorOpacity: 0.1,
                                                    blurColor: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    ),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.play_arrow,
                                                  color: Color(0xB9221235),
                                                  size: 25.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                title: Text(
                                  task.taskName!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 15.0,
                                  ),
                                ),
                                subtitle: Text(
                                  task.taskDescription!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 12.0,
                                  ),
                                ),
                                trailing: Container(
                                  height: 20,
                                  width: 50,
                                  color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      task.dueTime!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Twitterchirp",
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 25.0,
                                left: 70.0,
                                child: AnimatedContainer(
                                  height: 2.0,
                                  width: _lineWidth,
                                  color: Colors.white,
                                  duration: const Duration(milliseconds: 500),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 50.0),
                            child: Divider(height: 0.5, color: Colors.grey),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const ChartAndDescription(),
          ],
        ),
      ),
    );
  }
}
