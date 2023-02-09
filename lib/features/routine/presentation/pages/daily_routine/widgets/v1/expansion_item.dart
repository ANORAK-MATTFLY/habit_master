import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/domain/logic/task_helpers.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/check_box_tile.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v1/circle_avatar.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_icon.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_line.dart';

class ExpandedItemList extends StatefulWidget {
  final String title;
  final Widget progressRatio;
  final Color color;
  final Color shimmer;
  final Routine habit;
  const ExpandedItemList(
      {Key? key,
      required this.title,
      required this.progressRatio,
      required this.color,
      required this.shimmer,
      required this.habit})
      : super(key: key);

  @override
  State<ExpandedItemList> createState() => _ExpandedItemListState();
}

class _ExpandedItemListState extends State<ExpandedItemList> {
  final List<bool> _isOpen = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final streamedTasks = context.read<TaskListCubit>().state;
    List<Habit> tasks = [];
    if (widget.title == "Start your Morning Routine") {
      tasks = TaskHelpers.getMorningTasks(streamedTasks);
    }
    if (widget.title == "Kickoff your Afternoon!") {
      tasks = TaskHelpers.getAfternoonTasks(streamedTasks);
    }
    if (widget.title == "Finish your day in style!") {
      tasks = TaskHelpers.getEveningTasks(streamedTasks);
    }
    return ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 800),
        dividerColor: Colors.white,
        elevation: 0.0,
        children: [
          ExpansionPanel(
            backgroundColor: const Color.fromARGB(255, 7, 3, 15),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return SizedBox(
                height: 65.0,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sideIcon(isExpanded),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp",
                            fontSize: 17.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        widget.progressRatio,
                      ],
                    ),
                    Stack(
                      children: [
                        const SizedBox(
                          height: 30.0,
                          width: 80.0,
                        ),
                        Positioned(
                          left: 10.0,
                          child: tinyCircleAvatar(
                            "assets/images/avatars/av8.jpg",
                            const [
                              Color.fromARGB(255, 254, 169, 255),
                              Color.fromARGB(255, 254, 169, 255),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 30.0,
                          child: tinyCircleAvatar(
                            "assets/images/avatars/av5.jpg",
                            const [
                              Color.fromARGB(255, 169, 218, 255),
                              Color.fromARGB(255, 183, 169, 255),
                            ],
                          ),
                        ),
                        Positioned(
                            left: 50.0,
                            child: tinyCircleAvatar(
                                "assets/images/avatars/av1.jpg", const [
                              Color.fromARGB(255, 255, 228, 169),
                              Color.fromARGB(255, 255, 211, 169),
                            ])),
                      ],
                    ),
                  ],
                ),
              );
            },
            body: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(111, 13, 0, 20),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sideLine(widget.color, height: (tasks.length * 55)),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      width: width - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: tasks.map((task) {
                          //  task.type! == "check"
                          //     ?
                          return CheckBoxItem(
                            color: widget.color,
                            shimmer: widget.shimmer,
                            task: task,
                          );
                          // : GestureDetector(
                          //     onTap: () {
                          //       print(task.type);
                          //     },
                          //     child: const TimerHabit());
                        }).toList(),
                      )),
                ],
              ),
            ),
            isExpanded: _isOpen[0],
            canTapOnHeader: true,
          )
        ],
        expansionCallback: (index, isOpen) {
          setState(() {
            _isOpen[index] = !isOpen;
            // ExpendCubit
          });
        });
  }
}
