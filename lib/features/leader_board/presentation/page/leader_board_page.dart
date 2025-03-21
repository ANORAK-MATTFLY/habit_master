import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/leader_board/infrastructure/data_sources/remote/queries/leader_queries.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:habit_master/features/leader_board/presentation/widgets/top_leader_card.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minutes_cubit.dart';
import 'package:habit_master/shared/widgets/dynamic_island.dart';

import '../../../routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';

class CompetitionScreen extends StatefulWidget {
  const CompetitionScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionScreen> createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  @override
  Widget build(BuildContext context) {
    final timerControllerCubit = context.read<TimerControllerCubit>();

    return Scaffold(
      backgroundColor: const Color(0xFF0C051D),
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot<Object?>>(
              stream: serviceLocator<LeaderQueries>().getLeaders(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center();
                }

                if (snapshot.data == null) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      color: Colors.white,
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.active) {
                  final N = snapshot.data!.docs.length;
                  if (N < 2) {
                    return const Center(
                      child: Text(
                        "Not enough competitors for the moment",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  final List<Leader> competitors =
                      serviceLocator<LeaderRepository>().getLeaders(data);
                  return LeaderBoardData(
                    competitors: competitors,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  final N = snapshot.data!.docs.length;
                  if (N < 2) {
                    return const Center(
                      child: Text(
                        "Not enough competitors for the moment",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  final List<Leader> competitors =
                      serviceLocator<LeaderRepository>().getLeaders(data);
                  return LeaderBoardData(
                    competitors: competitors,
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  final N = snapshot.data!.docs.length;
                  if (N < 3) {
                    return const Center(
                      child: Text(
                        "There's not enough competitors for the moment",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  final List<Leader> competitors =
                      serviceLocator<LeaderRepository>().getLeaders(data);
                  return LeaderBoardData(
                    competitors: competitors,
                  );
                }

                return const Center();
              },
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
                      timerControllerCubit.updateState();
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
      ),
    );
  }
}

// ignore: must_be_immutable
class LeaderBoardData extends StatefulWidget {
  List<Leader> competitors;
  LeaderBoardData({Key? key, required this.competitors}) : super(key: key);

  @override
  State<LeaderBoardData> createState() => _LeaderBoardDataState();
}

class _LeaderBoardDataState extends State<LeaderBoardData> {
  @override
  Widget build(BuildContext context) {
    final competitors = widget.competitors;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: const Color(0xFF0C051D),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Leaderboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "How it works",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Twitterchirp_Bold",
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.help_outline_rounded,
                                color: Color.fromARGB(255, 178, 23, 255),
                                size: 25.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200.0,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        TopLeaderCard(
                          height: 120.0,
                          width: 90.0,
                          boxH: 90,
                          boxW: 90,
                          imageH: 80,
                          imageW: 80,
                          leader: competitors[1],
                          color: const Color.fromARGB(
                            255,
                            0,
                            242,
                            255,
                          ),
                          index: 2,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/icons/crown.png"),
                                ),
                              ),
                            ),
                            TopLeaderCard(
                              height: 130.0,
                              width: 140.0,
                              leader: competitors[0],
                              color: const Color.fromARGB(255, 255, 238, 0),
                              index: 1,
                              boxH: 110,
                              boxW: 100,
                              imageH: 100,
                              imageW: 100,
                            ),
                          ],
                        ),
                        TopLeaderCard(
                          leader: competitors.length >= 3
                              ? competitors[2]
                              : competitors[1],
                          color: const Color.fromARGB(255, 254, 169, 255),
                          index: 3,
                          height: 120.0,
                          width: 90.0,
                          boxH: 90,
                          boxW: 90,
                          imageH: 80,
                          imageW: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    height: 50.0,
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(199, 34, 105, 141),
                            Color.fromARGB(255, 52, 4, 79),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.0, 0.9],
                          tileMode: TileMode.clamp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "This are the achievers of the week! ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp_Bold",
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Good luck!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Twitterchirp_Bold",
                                  fontSize: 12.0,
                                  overflow: TextOverflow.ellipsis,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: competitors.length,
                          itemBuilder: (context, index) {
                            final competitor = competitors[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(360.0)),
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            competitor.profilePicture!),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  competitor.leaderName!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp_Bold",
                                    fontSize: 12.0,
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.none,
                                    wordSpacing: 5.0,
                                  ),
                                ),
                                trailing: SizedBox(
                                  height: 40.0,
                                  width: 100.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        index.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp_Bold",
                                          fontSize: 12.0,
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                          wordSpacing: 5.0,
                                        ),
                                      ),
                                      Text(
                                        "${competitor.score!} Pts",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp_Bold",
                                          fontSize: 12.0,
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                          wordSpacing: 5.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
