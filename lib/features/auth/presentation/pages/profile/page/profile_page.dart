import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:habit_master/features/auth/domain/logic/google_auth.dart';

import '../widgets/v1/dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _canReceiveNotifications = false;
  bool _canAppearOnLeaderBoard = false;
  bool _profileIsPrivate = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 1, 27),
        body: ListView(
          children: [
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 14, 1, 27),
                    Color.fromARGB(255, 15, 12, 18),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.2,
                    0.9,
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 270.0,
                        width: (width - 20),
                      ),
                      Container(
                          height: 200,
                          width: (width - 20),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(197, 4, 71, 76),
                                  Color.fromARGB(173, 4, 152, 145),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.9],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              height: 150.0,
                              width: (width - 80),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(187, 1, 42, 70),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      openDialog(context, "Change my username",
                                          "User Name");
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 40.0,
                                        left: 40.0,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(187, 1, 42, 70),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      child: const Text(
                                        "Becky Wallace",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp",
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoogleAuth().logout();
                                      GoogleAuth().dispose();
                                      // openDialog(context, "Change job title",
                                      //     "Job Title");
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 40.0,
                                        left: 40.0,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(187, 1, 42, 70),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      child: const Text(
                                        "UX Designer",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp",
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "1k Followers   |   21 Following",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp_Bold",
                                      fontSize: 13.0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        bottom: 0.0,
                        left: (width - 80) / 2,
                        child: Stack(
                          children: [
                            Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 0, 251, 255),
                                  width: 3.0,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(360.0),
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/avatars/av1.jpg"),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 0, 229, 254)
                                            .withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 20,
                                    offset: const Offset(2, 9),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          width: (width - 40),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(159, 41, 12, 68),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: (width - 40),
                          child: const Blur(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            blur: 60,
                            colorOpacity: 0.0,
                            blurColor: Color.fromARGB(84, 255, 255, 255),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 300,
                            width: (width - 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50.0,
                                  width: (width - 80),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(92, 18, 2, 13),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    activeColor:
                                        const Color.fromARGB(255, 38, 4, 66),
                                    checkColor:
                                        const Color.fromARGB(255, 152, 5, 220),
                                    side: const BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(255, 89, 89, 89)),
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    value: _canReceiveNotifications,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _canReceiveNotifications =
                                            !_canReceiveNotifications;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text(
                                      "Do not receive notifications",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Twitterchirp",
                                        fontSize: 13.0,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _canAppearOnLeaderBoard =
                                          !_canAppearOnLeaderBoard;
                                    });
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: (width - 80),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(92, 18, 2, 13),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7.0),
                                      ),
                                    ),
                                    child: CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 38, 4, 66),
                                      checkColor: const Color.fromARGB(
                                          255, 152, 5, 220),
                                      side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 89, 89, 89)),
                                      tileColor: Colors.red,
                                      checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      value: _canAppearOnLeaderBoard,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _canAppearOnLeaderBoard =
                                              !_canAppearOnLeaderBoard;
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text(
                                        "Do not appear on the leaderboard",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp",
                                          fontSize: 13.0,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _canAppearOnLeaderBoard =
                                          !_canAppearOnLeaderBoard;
                                    });
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: (width - 80),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(92, 18, 2, 13),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7.0),
                                      ),
                                    ),
                                    child: CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 38, 4, 66),
                                      checkColor: const Color.fromARGB(
                                          255, 152, 5, 220),
                                      side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 89, 89, 89)),
                                      tileColor: Colors.red,
                                      checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      value: _profileIsPrivate,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _profileIsPrivate =
                                              !_profileIsPrivate;
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text(
                                        "Do not show my profile to other users",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Twitterchirp",
                                          fontSize: 13.0,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
