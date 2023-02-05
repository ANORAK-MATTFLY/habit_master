import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/leader_board/presentation/bloc/bloc_logic/competitors_bloc.dart';
import 'package:habit_master/features/leader_board/presentation/bloc/bloc_state/competitors_state.dart';

class CompetitionScreen extends StatefulWidget {
  const CompetitionScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionScreen> createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0C051D),
      body: SafeArea(
        child: Container(
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
                    // color: Colors.red,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                SizedBox(
                                  height: 130.0,
                                  width: 100.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 100.0,
                                        width: 100.0,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 90.0,
                                              width: 90.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    0,
                                                    242,
                                                    255,
                                                  ),
                                                  width: 3.0,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(360.0),
                                                ),
                                                image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/avatars/av1.jpg"),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color.fromARGB(
                                                            255, 0, 242, 255)
                                                        .withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 20,
                                                    offset: const Offset(2,
                                                        9), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 25.0,
                                                width: 25.0,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 0, 242, 255),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(360.0),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "2",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          "Twitterchirp_Bold",
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Jessica Cher",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp_Bold",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 180.0,
                                  width: 120.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 155.0,
                                        width: 120.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Center(
                                                child: Container(
                                                  height: 110.0,
                                                  width: 110.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 255, 238, 0),
                                                      width: 3.0,
                                                      style: BorderStyle.solid,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                    image:
                                                        const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          "assets/images/avatars/av5.jpg"),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                238,
                                                                0)
                                                            .withOpacity(0.2),
                                                        spreadRadius: 5,
                                                        blurRadius: 20,
                                                        offset: const Offset(2,
                                                            9), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  height: 25.0,
                                                  width: 25.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 255, 238, 0),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "1",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Twitterchirp_Bold",
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: SizedBox(
                                                height: 32.0,
                                                width: 32.0,
                                                child: Image.asset(
                                                    "assets/images/icons/crown.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Sam Black",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp_Bold",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 130.0,
                                  width: 100.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 100.0,
                                        width: 100.0,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 90.0,
                                              width: 90.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 254, 169, 255),
                                                  width: 3.0,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(360.0),
                                                ),
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/images/avatars/av8.jpg"),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color.fromARGB(
                                                            255, 254, 169, 255)
                                                        .withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 20,
                                                    offset: const Offset(2,
                                                        9), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  height: 25.0,
                                                  width: 25.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 254, 169, 255),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "3",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Twitterchirp_Bold",
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Shade Williams",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp_Bold",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
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
                                "You currently rank",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "18th",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Twitterchirp_Bold",
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "1380 pts",
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
                            child: BlocBuilder<CompetitorsBloc, FetchResult?>(
                                buildWhen: (previousEvent, currentEvent) =>
                                    previousEvent!.competitors !=
                                    currentEvent!.competitors,
                                builder: (BuildContext context,
                                    FetchResult? result) {
                                  final competitors =
                                      result!.competitors["results"];
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: competitors.length,
                                      itemBuilder: (context, index) {
                                        final competitor = competitors[index]!;

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: ListTile(
                                            leading: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(360.0)),
                                              child: Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        competitor != null
                                                            ? competitor[
                                                                    "picture"]
                                                                ["medium"]
                                                            : "assets/images/avatars/av5.jpg"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              competitor["name"]["last"],
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    index.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "Twitterchirp_Bold",
                                                      fontSize: 12.0,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      decoration:
                                                          TextDecoration.none,
                                                      wordSpacing: 5.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "1239 Pts",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "Twitterchirp_Bold",
                                                      fontSize: 12.0,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      decoration:
                                                          TextDecoration.none,
                                                      wordSpacing: 5.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
