import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_history_repository.dart';

// ignore: must_be_immutable
class ProgressGraph extends StatefulWidget {
  Habit habit;
  ProgressGraph({Key? key, required this.habit}) : super(key: key);

  @override
  State<ProgressGraph> createState() => _ProgressGraphState();
}

class _ProgressGraphState extends State<ProgressGraph> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<HabitHistory>>(
          future: serviceLocator<HabitHistoryRepository>()
              .getHabitHistoryRecord(widget.habit.id!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  color: Colors.white,
                ),
              );
            }
            final progressHistory = snapshot.data!;
            Map<DateTime, int>? heatMapData = {};
            for (var data in progressHistory) {
              heatMapData.putIfAbsent(DateTime.parse(data.doneOn!), () => 10);
            }
            return Container(
              height: 300,
              width: MediaQuery.of(context).size.width + 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ),
              child: Center(
                child: HeatMapCalendar(
                  showColorTip: false,
                  defaultColor: const Color.fromARGB(255, 79, 79, 79),
                  flexible: true,
                  colorMode: ColorMode.color,
                  textColor: Colors.black,
                  initDate: DateTime.now(),
                  weekTextColor: Colors.white,
                  monthFontSize: 17.0,
                  datasets: heatMapData,
                  colorsets: const {
                    1: Color.fromARGB(255, 255, 242, 2),
                  },
                ),
              ),
            );
          }),
    );
  }
}
