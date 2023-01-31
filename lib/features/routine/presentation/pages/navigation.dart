// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/bloc/events/load_person_action.dart';
// import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/bloc/logic.dart';
// import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/page/daily_routine_page.dart';

// import '../bloc/competitors_bloc.dart';
// import 'competition_page.dart';

// class RoutineNavigation extends StatefulWidget {
//   const RoutineNavigation({Key? key}) : super(key: key);

//   @override
//   State<RoutineNavigation> createState() => _RoutineNavigationState();
// }

// class _RoutineNavigationState extends State<RoutineNavigation> {
//   int index = 0;
//   final List screens = const [
//     DailyRoutinePage(),
//     CompetitionScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Material(
//       child: SizedBox(
//         height: height,
//         width: width,
//         child: Stack(children: [
//           screens[index],
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(30.0)),
//                 child: Container(
//                     height: 40.0,
//                     width: (width - 150.0),
//                     decoration: const BoxDecoration(
//                       color: Color.fromARGB(244, 33, 5, 58),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             context.read<CompetitorsBloc>().add(
//                                   const LoadCompetitorsAction(
//                                     url: PersonUrl.persons1,
//                                   ),
//                                 );
//                             setState(() {
//                               index = 0;
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.task_alt_outlined,
//                             size: 25.0,
//                             color: Color.fromARGB(255, 177, 177, 177),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               index = 1;
//                             });

//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) =>
//                             //         BlocBuilder<CompetitorsEventType, FetchResult?>(
//                             //       bloc: ,
//                             //       builder:
//                             //           (context, canDisplayOnboardingScreen) =>
//                             //               const CompetitionScreen(),
//                             //     ),
//                             //   ),
//                             // );
//                           },
//                           icon: const Icon(
//                             Icons.sports_score_sharp,
//                             size: 25.0,
//                             color: Color.fromARGB(255, 177, 177, 177),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               index = 2;
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.calendar_month_outlined,
//                             size: 25.0,
//                             color: Color.fromARGB(255, 177, 177, 177),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
