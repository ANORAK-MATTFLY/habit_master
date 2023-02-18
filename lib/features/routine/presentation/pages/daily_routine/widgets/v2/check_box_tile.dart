import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/toggle_habit_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/toggle_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/progress_graph.dart';

class CheckBoxItem extends StatefulWidget {
  final Color? color;
  final Color? shimmer;
  final Habit? habit;
  const CheckBoxItem({
    Key? key,
    required this.color,
    required this.shimmer,
    required this.habit,
  }) : super(key: key);

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  bool _triggerState = false;
  @override
  void initState() {
    super.initState();
    _triggerState = widget.habit!.isDone!;
  }

  // double _width = 0.0;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: widget.color,
      checkColor: const Color.fromARGB(255, 28, 4, 53),
      side: const BorderSide(width: 1, color: Color.fromARGB(255, 89, 89, 89)),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      secondary: IconButton(
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
                  decoration: TextDecoration.none,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              content: ProgressGraph(habit: widget.habit!),
            ).animate().fadeIn(),
          );
        },
        icon: Icon(
          CupertinoIcons.circle_grid_3x3,
          color: widget.color,
          size: 20.0,
        ),
      ),
      value: _triggerState,
      onChanged: (bool? value) async {
        setState(() {
          _triggerState = !_triggerState;
          context.read<HabitBlocLogic>().add(
                ToggleHabitAction(habit: widget.habit!),
              );
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: throwLine(_triggerState, widget.color!, widget.shimmer,
          widget.habit!.habitName!),
    );
  }
}

Widget throwLine(bool showLine, Color color, shimmer, String task) {
  return showLine == false
      ? Stack(
          children: [
            Text(
              task,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Twitterchirp",
                fontSize: 17.0,
                decoration: TextDecoration.none,
              ),
            ),
            Positioned(
              bottom: 7.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: color,
                height: 1.5,
                width: 0.0,
              ),
            )
          ],
        )
      : Stack(
          children: [
            Text(
              task,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: "Twitterchirp",
                fontSize: 17.0,
                decoration: TextDecoration.none,
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(color: shimmer, duration: 1800.ms),
            Positioned(
              bottom: 7.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: color,
                height: 1.5,
                width: 240.0,
              ),
            )
          ],
        );
}
