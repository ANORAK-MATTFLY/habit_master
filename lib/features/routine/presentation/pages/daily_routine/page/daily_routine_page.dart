import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/habit_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/features/routine/presentation/pages/navigation/bottom_app_bar.dart';

import '../../create_habit/page/create_habit_page.dart';
import '../widgets/v1/expansion_item.dart';
import '../widgets/v1/progress.dart';

import '../widgets/v1/chart_and_desc.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    getTasks(streamedTasks) =>
        context.read<TaskListCubit>().updateState(streamedTasks);
    final habit = context.read<HabitCubit>().state!;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 3, 15),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateHabitPage(),
            ),
          );
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
            child: const Icon(
              CupertinoIcons.add,
              size: 20.0,
            ).animate().slideY(
                  begin: -1,
                  duration: const Duration(milliseconds: 500),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuspendedBottomAppBar(),
                  ),
                );
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
            onTap: () {},
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
          StreamBuilder<List<Habit>>(
              stream: HabitQueries(habit.authorID!).stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text("An error occurred"),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CupertinoActivityIndicator(
                          animating: true, color: Colors.white),
                    );
                  case ConnectionState.active:
                    final streamedTasks = snapshot.data!;
                    getTasks(streamedTasks);
                    return Container(
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    child: ExpandedItemList(
                                      habit: habit,
                                      title: "Start your Morning Routine",
                                      progressRatio: progress(
                                        "0/3",
                                        const Color.fromARGB(255, 255, 230, 0),
                                      ),
                                      shimmer: Colors.white.withOpacity(0.2),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 0),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: ExpandedItemList(
                                      habit: habit,
                                      title: "Kickoff your Afternoon!",
                                      progressRatio: progress(
                                        "0/4",
                                        const Color.fromARGB(
                                            255, 246, 149, 255),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 246, 149, 255),
                                      shimmer: const Color.fromARGB(
                                          255, 246, 149, 255),
                                    ),
                                  ),
                                  ExpandedItemList(
                                    habit: habit,
                                    title: "Finish your day in style!",
                                    progressRatio: progress(
                                      "0/3",
                                      const Color.fromARGB(255, 0, 255, 247),
                                    ),
                                    color:
                                        const Color.fromARGB(255, 0, 255, 247),
                                    shimmer:
                                        const Color.fromARGB(255, 0, 255, 247),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ChartAndDescription(habit: habit),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    {
                      final streamedTasks = snapshot.data!;
                      getTasks(streamedTasks);
                      return Container(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40.0),
                                      child: ExpandedItemList(
                                        habit: habit,
                                        title: "Start your Morning Routine",
                                        progressRatio: progress(
                                          "0/3",
                                          const Color.fromARGB(
                                              255, 255, 230, 0),
                                        ),
                                        shimmer: Colors.white.withOpacity(0.2),
                                        color: const Color.fromARGB(
                                            255, 255, 230, 0),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40.0),
                                      child: ExpandedItemList(
                                        habit: habit,
                                        title: "Kickoff your Afternoon!",
                                        progressRatio: progress(
                                          "0/4",
                                          const Color.fromARGB(
                                              255, 246, 149, 255),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 246, 149, 255),
                                        shimmer: const Color.fromARGB(
                                            255, 246, 149, 255),
                                      ),
                                    ),
                                    ExpandedItemList(
                                      habit: habit,
                                      title: "Finish your day in style!",
                                      progressRatio: progress(
                                        "0/3",
                                        const Color.fromARGB(255, 0, 255, 247),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 0, 255, 247),
                                      shimmer: const Color.fromARGB(
                                          255, 0, 255, 247),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ChartAndDescription(habit: habit),
                          ],
                        ),
                      );
                    }
                }
              }),
        ],
      ),
    );
  }
}
