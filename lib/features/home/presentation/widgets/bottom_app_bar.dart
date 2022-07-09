import 'package:flutter/material.dart';
import 'package:habit_master/features/home/presentation/pages/home_page.dart';

import '../../../routine/presentation/pages/routine-details/navigation.dart';

class SuspendedBottomAppBar extends StatefulWidget {
  const SuspendedBottomAppBar({Key? key}) : super(key: key);

  @override
  State<SuspendedBottomAppBar> createState() => _SuspendedBottomAppBarState();
}

class _SuspendedBottomAppBarState extends State<SuspendedBottomAppBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final screens = [const HomePage(), const RoutineNavigation()];
    return Material(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            screens[index],
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 20.0),
            //     child: ClipRRect(
            //       borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            //       child: Container(
            //           height: 50.0,
            //           width: (width - 50.0),
            //           decoration: const BoxDecoration(
            //             color: Color.fromARGB(231, 12, 3, 26),
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     index = 0;
            //                   });
            //                 },
            //                 icon: const Icon(
            //                   Icons.home_filled,
            //                   size: 25.0,
            //                   color: Color.fromARGB(255, 177, 177, 177),
            //                 ),
            //               ),
            //               IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     index = 1;
            //                   });
            //                 },
            //                 icon: const Icon(
            //                   Icons.window_rounded,
            //                   size: 25.0,
            //                   color: Color.fromARGB(255, 177, 177, 177),
            //                 ),
            //               ),
            //               IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     index = 2;
            //                   });
            //                 },
            //                 icon: const Icon(
            //                   Icons.record_voice_over,
            //                   size: 25.0,
            //                   color: Color.fromARGB(255, 177, 177, 177),
            //                 ),
            //               ),
            //               IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     index = 3;
            //                   });
            //                 },
            //                 icon: const Icon(
            //                   Icons.settings,
            //                   size: 25.0,
            //                   color: Color.fromARGB(255, 177, 177, 177),
            //                 ),
            //               ),
            //             ],
            //           )),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
