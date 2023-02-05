import 'package:flutter/material.dart';

class TimerHabit extends StatefulWidget {
  const TimerHabit({Key? key}) : super(key: key);

  @override
  State<TimerHabit> createState() => _TimerHabitState();
}

class _TimerHabitState extends State<TimerHabit> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 40.0,
      width: width,
      color: Colors.blueAccent,
      child: const Center(
        child: Text("Habit's name"),
      ),
    );
  }
}
