import 'package:flutter/material.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/check_box_tile.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/circle_avatar.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/side_icon.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/side_line.dart';

class ExpandedItemList extends StatefulWidget {
  final String title;
  final Widget progressRatio;
  final Color color;
  const ExpandedItemList(
      {Key? key,
      required this.title,
      required this.progressRatio,
      required this.color})
      : super(key: key);

  @override
  State<ExpandedItemList> createState() => _ExpandedItemListState();
}

class _ExpandedItemListState extends State<ExpandedItemList> {
  final List<bool> _isOpen = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 800),
      dividerColor: Colors.white,
      elevation: 0.0,
      children: [
        ExpansionPanel(
          backgroundColor: const Color.fromARGB(255, 7, 3, 15),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return SizedBox(
              height: 65.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sideIcon(isExpanded),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp",
                          fontSize: 17.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      widget.progressRatio,
                    ],
                  ),
                  Stack(
                    children: [
                      const SizedBox(
                        height: 30.0,
                        width: 80.0,
                      ),
                      Positioned(
                        left: 10.0,
                        child: tinyCircleAvatar(
                          "assets/images/avatars/av8.jpg",
                          const [
                            Color.fromARGB(255, 254, 169, 255),
                            Color.fromARGB(255, 254, 169, 255),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 30.0,
                        child: tinyCircleAvatar(
                          "assets/images/avatars/av5.jpg",
                          const [
                            Color.fromARGB(255, 169, 218, 255),
                            Color.fromARGB(255, 183, 169, 255),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 50.0,
                          child: tinyCircleAvatar(
                              "assets/images/avatars/av1.jpg", const [
                            Color.fromARGB(255, 255, 228, 169),
                            Color.fromARGB(255, 255, 211, 169),
                          ])),
                    ],
                  ),
                ],
              ),
            );
          },
          body: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(111, 13, 0, 20),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sideLine(widget.color),
                SizedBox(
                    height: 300,
                    width: width - 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CheckBoxItem(color: widget.color),
                        CheckBoxItem(color: widget.color),
                        CheckBoxItem(color: widget.color),
                        CheckBoxItem(color: widget.color),
                        CheckBoxItem(color: widget.color),
                      ],
                    )),
              ],
            ),
          ),
          isExpanded: _isOpen[0],
          canTapOnHeader: true,
        )
      ],
      expansionCallback: (index, isOpen) => setState(
        () => _isOpen[index] = !isOpen,
      ),
    );
  }
}

// ExpansionPanelList expansionItem(
//     double width, bool isOpen, String title, Widget progressRatio) {
//   return 
// }
