import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/states/cubit/show_panel.dart';

import '../widgets/daily_routine/add_habit_panel.dart';
import '../widgets/daily_routine/expansion_item.dart';
import '../widgets/daily_routine/progress.dart';

import 'chart_and_desc.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage>
    with SingleTickerProviderStateMixin {
  bool isTap = false;
  bool canMove = false;
  bool animateFloatingActionButton = false;
  @override
  Widget build(BuildContext context) {
    final canDisplayHabitPanel =
        BlocProvider.of<ShowAddHabitPanelCubit>(context);

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            animateFloatingActionButton = !animateFloatingActionButton;
          });
          context.read<ShowAddHabitPanelCubit>().updateState();
        },
        child: Container(
          height: 40.0,
          width: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 143, 255),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 216, 143, 255).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 20.0,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: animateFloatingActionButton == false
                ? const Icon(
                    Icons.add,
                  ).animate().slideY(
                      begin: -1,
                      duration: const Duration(milliseconds: 500),
                    )
                : const Text(
                    "X",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: "Twitterchirp",
                    ),
                  ).animate().slideY(
                      begin: -2,
                      duration: const Duration(milliseconds: 300),
                    ),
          ),
        ).animate().slideY(
              begin: -0.3,
              duration: const Duration(milliseconds: 800),
            ),
      ),
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
      body: Stack(
        children: [
          Container(
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
                            shimmer: Colors.white.withOpacity(0.2),
                            color: const Color.fromARGB(255, 255, 230, 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: ExpandedItemList(
                            title: "Kickoff your Afternoon!",
                            progressRatio: progress(
                              "0/4",
                              const Color.fromARGB(255, 246, 149, 255),
                            ),
                            color: const Color.fromARGB(255, 246, 149, 255),
                            shimmer: const Color.fromARGB(255, 246, 149, 255),
                          ),
                        ),
                        ExpandedItemList(
                          title: "Finish your day in style!",
                          progressRatio: progress(
                            "0/3",
                            const Color.fromARGB(255, 0, 255, 247),
                          ),
                          color: const Color.fromARGB(255, 0, 255, 247),
                          shimmer: const Color.fromARGB(255, 0, 255, 247),
                        ),
                      ],
                    ),
                  ),
                ),
                const ChartAndDescription(),
              ],
            ),
          ),
          BlocBuilder<ShowAddHabitPanelCubit, bool>(
            bloc: canDisplayHabitPanel,
            builder: (context, canDisplayHabitPanel) {
              return Visibility(
                visible: canDisplayHabitPanel,
                child: Align(
                  alignment: Alignment.center,
                  child: const HabitPanel().animate().fadeIn(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
