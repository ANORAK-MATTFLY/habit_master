import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/features/routine/domain/logic/prebuilt_data.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/routine_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/home/widgets/v1/small_card.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_master/shared/features/routine/widgets/circle.dart';
import 'package:intl/intl.dart';

import 'package:habit_master/features/routine/presentation/pages/home/widgets/v1/large_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../shared/widgets/dynamic_island.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    DateTime today = DateTime.now();
    final month = DateFormat("MMMM")
        .format(today)
        .split("")
        .sublist(0, 3)
        .join()
        .toUpperCase();

    final day = DateFormat('EEEE').format(today).toUpperCase();
    final dayNumber = today.day;
    final listOfCard = [
      FutureBuilder<List<Routine>>(
          future: RoutineQueries().getRoutinesData("local"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text("An error occurred"),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CupertinoActivityIndicator(
                      animating: true, color: Colors.white),
                );
              case ConnectionState.active:
                return const Center(
                  child: CupertinoActivityIndicator(
                      animating: true, color: Colors.white),
                );
              case ConnectionState.done:
                {
                  final List<Routine> routines = snapshot.data!;

                  return Container(
                    height: 310.0,
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: LargeCard(routines: routines),
                  );
                }
            }
          }),
      GestureDetector(
        onTap: () async {
          // PrebuiltData().createPrebuiltData();
          // oJhwCqcn8ISA2K9Rl5gvVsyjLVG2
          final database = await LocalDatabase.instance.database;
          final query = LocalDatabaseConstantProvider.getHabits(
              "O8oaQAXmDQPRuZ2N9aTiby5JQNx2");
          final habit = await database.rawQuery(query);
          print(habit.length);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(145, 0, 0, 0),
                  blurRadius: 9,
                  spreadRadius: 9)
            ],
            color: Color.fromARGB(221, 6, 12, 20),
          ),
          child: Center(
            child: ListTile(
              title: GradientText(
                "CAN YOU PLEASE GIVE US A FEEDBACK?",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Twitterchirp_Bold",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                colors: const [
                  Color(0xCBB0D9F1),
                  Color(0xFF8E6AE4),
                ],
              ),
              subtitle: const Text(
                " By doing so you will help us improve the app.",
                style: TextStyle(
                  color: Color(0xB7B9B8B8),
                  fontFamily: "Twitterchirp",
                  fontSize: 10.0,
                  overflow: TextOverflow.clip,
                ),
              ),
              trailing: GestureDetector(
                onTap: () async {
                  final String appLink =
                      "https://play.google.com/store/apps/details?id=com.softwareTools.habitMaster";
                  final Uri _url = Uri.parse(appLink);
                  await launchUrl(_url);
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(360.0),
                    ),
                    border: Border.all(
                        color: const Color(0xFF3F3F3F),
                        style: BorderStyle.solid,
                        width: 0.4),
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/svg/link.svg",
                        height: 12,
                        color: const Color(0xFF807E7E),
                        semanticsLabel: 'A red up arrow'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 40.0, right: 200.0),
        height: 40.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(208, 6, 12, 20),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
          border: Border.all(
              color: const Color.fromARGB(255, 199, 156, 255), width: 1.5),
        ),
        child: Center(
          child: GradientText(
            "Community",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Twitterchirp_Bold",
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            colors: const [
              Color.fromARGB(255, 176, 217, 241),
              Color.fromARGB(255, 195, 169, 255),
            ],
          ),
        ),
      ),
      FutureBuilder<List<Routine>>(
          future: RoutineQueries().getRoutinesData("remote"),
          builder: (context, snapshot) {
            if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Lottie.asset(
                    "assets/animations/not_found.json",
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset("assets/animations/loading_3.json"),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final routines = snapshot.data!;
              print(routines);
              return SmallCard(routines: routines);
            }
            return Center(
              child: SizedBox(
                height: 80.0,
                width: 80.0,
                child: Lottie.asset(
                  "assets/animations/not_found.json",
                ),
              ),
            );
          }),
    ];

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: const Color(0xFF0C051D),
            floating: true,
            snap: true,
            toolbarHeight: 100.0,
            actions: <Widget>[
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        const Positioned(
                            right: 35.0,
                            top: 55.0,
                            child: SizedBox(
                                height: 30, width: 30, child: Circle())),
                        Container(
                          padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "$day, $month $dayNumber",
                                style: const TextStyle(
                                  color: Color(0xB7FFFFFF),
                                  fontFamily: "Twitterchirp",
                                  fontSize: 12.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Habit Masters",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    // child: Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(
                                    //           right: 30.0),
                                    //       child: ClipRRect(
                                    //         borderRadius:
                                    //             const BorderRadius.all(
                                    //           Radius.circular(360.0),
                                    //         ),
                                    //         child: GestureDetector(
                                    //           key: const Key('K'),
                                    //           onTap: () => context
                                    //               .read<OnboardingCubit>()
                                    //               .updateState(),
                                    //           child: Container(
                                    //             height: 30.0,
                                    //             width: 30.0,
                                    //             color: const Color(0xFF393939)
                                    //                 .withOpacity(0.9),
                                    //             child: Center(
                                    //               child: SvgPicture.asset(
                                    //                   "assets/svg/search-icon.svg",
                                    //                   height: 12,
                                    //                   semanticsLabel:
                                    //                       'A red up arrow'),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     GestureDetector(
                                    //       onTap: () {
                                    //         Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 const ProfilePage(),
                                    //           ),
                                    //         );
                                    //       },
                                    //       child: ClipRRect(
                                    //         borderRadius:
                                    //             const BorderRadius.all(
                                    //                 Radius.circular(360.0)),
                                    //         child: Container(
                                    //           height: 30.0,
                                    //           width: 30.0,
                                    //           color: const Color(0xFF393939)
                                    //               .withOpacity(0.9),
                                    //           child: Center(
                                    //             child: SvgPicture.asset(
                                    //               "assets/svg/user-profile-icon.svg",
                                    //               height: 12,
                                    //               semanticsLabel:
                                    //                   'User profile icon',
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<StreamTimerBLoc, Stream<String>?>(
                      buildWhen: (previous, current) {
                    return previous != current;
                  }, builder: (context, state) {
                    if (state == null) {
                      return const Center();
                    }
                    return StreamBuilder<String>(
                        stream: state,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return const Center();
                          }

                          if (snapshot.data == "59") {
                            context.read<MinutesCounterCubit>().updateState();
                          }
                          if (context.read<MinutesCounterCubit>().state >=
                              context.read<MinutesCubit>().state) {
                            context.read<TimerControllerCubit>().updateState();
                            return const Center();
                          }

                          final String remainingTime = snapshot.data!;
                          return DynamicIsland(
                              remainingTime:
                                  "${context.read<MinutesCounterCubit>().state} : $remainingTime");
                        });
                  }),
                ],
              ),
            ],
          ),
        ],
        body: Stack(
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF0C051D),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: height,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg.png"),
                            alignment: Alignment.center,
                            opacity: 0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    itemCount: listOfCard.length,
                    itemBuilder: (BuildContext context, int index) {
                      final section = listOfCard[index];
                      return section;
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
