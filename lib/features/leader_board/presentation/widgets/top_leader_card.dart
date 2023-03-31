import 'package:flutter/material.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';

import '../../../../shared/logic/text_trimer.dart';

// ignore: must_be_immutable
class TopLeaderCard extends StatefulWidget {
  Leader leader;
  int index;
  final double height;
  final double width;
  final double boxH;
  final double boxW;
  final double imageH;
  final double imageW;
  Color color;
  TopLeaderCard({
    Key? key,
    required this.leader,
    required this.height,
    required this.width,
    required this.color,
    required this.index,
    required this.boxH,
    required this.boxW,
    required this.imageH,
    required this.imageW,
  }) : super(key: key);

  @override
  State<TopLeaderCard> createState() => TopLeaderStateCard();
}

// ignore: camel_case_types
class TopLeaderStateCard extends State<TopLeaderCard> {
  @override
  Widget build(BuildContext context) {
    final leader = widget.leader;
    final name = textTrimer(leader.leaderName!, 12);
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: widget.boxH,
            width: widget.boxW,
            child: Stack(
              children: [
                Container(
                  height: widget.imageH,
                  width: widget.imageW,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.color,
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
                        color: widget.color.withOpacity(0.2),
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
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: const BorderRadius.all(
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
            name,
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
