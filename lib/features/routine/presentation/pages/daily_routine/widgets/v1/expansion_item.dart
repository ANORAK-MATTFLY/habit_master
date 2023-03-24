import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/domain/logic/task_helpers.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc_event/time_stream_event.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habits_list.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minitutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/check_box_tile.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v1/circle_avatar.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/progress_graph.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_icon.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_line.dart';

class ExpandedItemList extends StatefulWidget {
  final String title;
  final Widget progressRatio;
  final Color color;
  final Color shimmer;
  const ExpandedItemList({
    Key? key,
    required this.title,
    required this.progressRatio,
    required this.color,
    required this.shimmer,
  }) : super(key: key);

  @override
  State<ExpandedItemList> createState() => _ExpandedItemListState();
}

class _ExpandedItemListState extends State<ExpandedItemList> {
  final List<bool> _isOpen = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final streamedTasks = context.read<HabitListCubit>().state;
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
    final timerControllerCubit = context.read<TimerControllerCubit>();

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
                        children: tasks.map((habit) {
                          return Dismissible(
                            key: Key(habit.id!),
                            background: Container(
                              color: const Color.fromARGB(255, 255, 103, 92),
                              alignment: AlignmentDirectional.centerEnd,
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            onDismissed: ((direction) {
                              setState(() {
                                streamedTasks
                                    .removeAt(streamedTasks.indexOf(habit));
                                tasks.removeAt(tasks.indexOf(habit));
                              });
                            }),
                            child: habit.type == "check"
                                ? CheckBoxItem(
                                    color: widget.color,
                                    shimmer: widget.shimmer,
                                    habit: habit,
                                  )
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    height: 60.0,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            timerControllerCubit.updateState();
                                            context
                                                .read<MinutesCounterCubit>()
                                                .setMinute(0);
                                            print(timerControllerCubit.state);

                                            final int duration =
                                                int.parse(habit.duration!) - 1;
                                            context
                                                .read<MinutesCubit>()
                                                .setMinute(duration);

                                            context.read<StreamTimerBLoc>().add(
                                                  TimeStreamEvent(
                                                      minutes: duration),
                                                );
                                          },
                                          child: Container(
                                            height: 40.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: widget.color,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(15.0),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text("Start"),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          habit.habitName!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Twitterchirp",
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                  "Your monthly progression on this task over the month",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Twitterchirp",
                                                    fontSize: 14.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                content: ProgressGraph(
                                                    habit: habit!),
                                              ).animate().fadeIn(),
                                            );
                                          },
                                          icon: Icon(
                                            CupertinoIcons.circle_grid_3x3,
                                            color: widget.color,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    )),
                          );
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
