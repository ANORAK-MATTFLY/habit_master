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
            defaultColor: const Color.fromARGB(255, 223, 102, 241),
            flexible: true,
            colorMode: ColorMode.color,
            textColor: Colors.black,
            initDate: DateTime.now(),
            weekTextColor: Colors.white,
            monthFontSize: 17.0,
            datasets: {
              DateTime(2023, 1, 6): 3,
              DateTime(2023, 1, 7): 2,
              DateTime(2023, 1, 8): 10,
              DateTime(2023, 1, 9): 130,
              DateTime(2023, 1, 13): 6,
            },
            colorsets: const {
              1: Color.fromARGB(255, 21, 235, 203),
            },
            // onClick: (value) {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text(value.toString())));
            // },
          ),
        ),
      ),
    );
  }
}
// HeatMap(
//             datasets: {
//               DateTime(2023, 1, 6): 3,
//               DateTime(2023, 1, 7): 7,
//               DateTime(2023, 1, 8): 10,
//               DateTime(2023, 1, 9): 13,
//               DateTime(2023, 1, 13): 6,
//             },
//             colorMode: ColorMode.opacity,
//             showText: false,
//             scrollable: true,
//             colorsets: const {
//               1: Colors.red,
//               3: Colors.orange,
//               5: Colors.yellow,
//               7: Colors.green,
//               9: Colors.blue,
//               11: Colors.indigo,
//               13: Colors.purple,
//             },
//             onClick: (value) {
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: Text(value.toString())));
//             },
//           ),
