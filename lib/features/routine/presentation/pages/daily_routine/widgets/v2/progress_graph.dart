import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class ProgressGraph extends StatefulWidget {
  const ProgressGraph({Key? key}) : super(key: key);

  @override
  State<ProgressGraph> createState() => _ProgressGraphState();
}

class _ProgressGraphState extends State<ProgressGraph> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
            defaultColor: const Color.fromARGB(255, 30, 30, 30),
            flexible: true,
            colorMode: ColorMode.color,
            textColor: Colors.white,
            initDate: DateTime.now(),
            weekTextColor: Colors.white,
            monthFontSize: 17.0,
            datasets: {
              DateTime(2023, 2, 6): 3,
              DateTime(2023, 2, 7): 2,
              DateTime(2023, 2, 8): 10,
              DateTime(2023, 2, 9): 130,
              DateTime(2023, 2, 13): 6,
            },
            colorsets: const {
              1: Color.fromARGB(255, 0, 207, 193),
            },
          ),
        ),
      ),
    );
  }
}
