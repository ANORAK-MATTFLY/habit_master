import 'package:flutter/material.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

// ignore: must_be_immutable
class TopLeaderCard extends StatefulWidget {
  Leader leader;
  int index;
  final double height;
  final double width;
  Color color;
  TopLeaderCard({
    Key? key,
    required this.leader,
    required this.height,
    required this.width,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  State<TopLeaderCard> createState() => TopLeaderStateCard();
}

// ignore: camel_case_types
class TopLeaderStateCard extends State<TopLeaderCard> {
  @override
  Widget build(BuildContext context) {
    final leader = widget.leader;
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: const Color.fromARGB(255, 254, 169, 255),
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(360.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(leader.profilePicture!),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 254, 169, 255)
                            .withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset:
                            const Offset(2, 9), // changes position of shadow
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
                        color: Color.fromARGB(255, 254, 169, 255),
                        borderRadius: BorderRadius.all(
                          Radius.circular(360.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.index.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Twitterchirp_Bold",
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Text(
            leader.leaderName!,
            style: const TextStyle(
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
    );
  }
}
