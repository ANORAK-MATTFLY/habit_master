import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF120325),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 300.0,
            width: MediaQuery.of(context).size.width - 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF350066),
                  Color(0xFF430079),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage("assets/images/thomas_frank.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Ben Matanda",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp_Bold",
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Text(
                  "Hey! 👋 I'm a Web Designer",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp_Bold",
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150.0,
            width: MediaQuery.of(context).size.width - 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Color(0xFF350066),
            ),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.ac_unit),
                      Text(
                        "Sign",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ]),
                const Divider(
                  color: Colors.grey,
                  height: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.ac_unit),
                    Text(
                      "Size",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp_Bold",
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.ac_unit),
                      Text(
                        "Size",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
