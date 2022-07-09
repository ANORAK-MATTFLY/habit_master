import 'package:flutter/material.dart';
import 'package:habit_master/features/routine/presentation/pages/routine-details/daily_routine_page.dart';

class RoutineNavigation extends StatefulWidget {
  const RoutineNavigation({Key? key}) : super(key: key);

  @override
  State<RoutineNavigation> createState() => _RoutineNavigationState();
}

class _RoutineNavigationState extends State<RoutineNavigation> {
  int index = 0;
  final List screens = const [DailyRoutinePage()];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          screens[index],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                    height: 40.0,
                    width: (width - 150.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(244, 33, 5, 58),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          icon: const Icon(
                            Icons.task_alt_outlined,
                            size: 25.0,
                            color: Color.fromARGB(255, 177, 177, 177),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          icon: const Icon(
                            Icons.sports_score_sharp,
                            size: 25.0,
                            color: Color.fromARGB(255, 177, 177, 177),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            size: 25.0,
                            color: Color.fromARGB(255, 177, 177, 177),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
