import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/user_feed/domain/logic/post_logic.dart';
import 'package:habit_master/shared/logic/text_trimer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EditPostPanel extends StatefulWidget {
  const EditPostPanel({Key? key}) : super(key: key);

  @override
  State<EditPostPanel> createState() => _EditPostPanelState();
}

class _EditPostPanelState extends State<EditPostPanel> {
  final TextEditingController postContent = TextEditingController();
  String postType = "Thought 🧠";
  bool canPublish = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: canPublish,
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              height: (400.0),
              width: (width - 40.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 16, 4, 35),
                    Color.fromARGB(255, 31, 2, 47),
                    Color.fromARGB(255, 20, 6, 45),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.2, 0.5, 0.8],
                  tileMode: TileMode.clamp,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 80.0,
                      width: double.infinity,
                      child: Center(
                        child: GradientText(
                          "Inspire or motivate others!",
                          style: const TextStyle(
                            fontFamily: "Twitterchirp_Bold",
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            overflow: TextOverflow.clip,
                          ),
                          colors: const [
                            Color.fromARGB(255, 138, 8, 193),
                            Color.fromARGB(200, 255, 172, 104),
                            Color.fromARGB(255, 211, 117, 11),
                            Color.fromARGB(255, 165, 3, 119),
                          ],
                        ),
                      )),
                  SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                postType = "Motivation";
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 225, 176, 254),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 166, 63, 198),

                                    spreadRadius: 2,
                                    blurRadius: 15.0,
                                    offset: Offset(
                                        0, 9), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Motivation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                postType = "Thought 🧠";
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 225, 176, 254),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 166, 63, 198),

                                    spreadRadius: 2,
                                    blurRadius: 15.0,
                                    offset: Offset(
                                        0, 9), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Thought 🧠",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                postType = "Inspiration";
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 225, 176, 254),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 166, 63, 198),
                                    spreadRadius: 2,
                                    blurRadius: 15.0,
                                    offset: Offset(
                                        0, 9), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Inspiration",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: (width - 70.0),
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(129, 27, 27, 27),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: TextFormField(
                      controller: postContent,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp_bold",
                        fontSize: 13.0,
                        decoration: TextDecoration.none,
                        overflow: TextOverflow.ellipsis,
                      ),
                      decoration: InputDecoration(
                        icon: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            color: Color.fromARGB(255, 253, 183, 255),
                          ),
                          child: const Icon(
                            CupertinoIcons.text_quote,
                            color: Color.fromARGB(255, 27, 5, 44),
                          ),
                        ),
                        labelText: "0/240",
                        labelStyle: const TextStyle(
                          color: Color(0xFFB4B4B4),
                          fontFamily: "Twitterchirp",
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (canPublish == true) {
                        if (postContent.text.length > 0) {
                          final content = textTrimer(postContent.text, 240);
                          await serviceLocator<PostLogic>()
                              .createPost(content, postType);
                          setState(() {
                            canPublish = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      height: 40.0,
                      width: (180),
                      decoration: BoxDecoration(
                        gradient: canPublish == true
                            ? LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 121, 8, 169),
                                  Color.fromARGB(208, 255, 212, 56),
                                  Color.fromARGB(255, 255, 182, 65),
                                  Color.fromARGB(255, 127, 9, 160),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.3, 0.5, 0.9],
                                tileMode: TileMode.clamp,
                              )
                            : LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 160, 160, 160),
                                  Color.fromARGB(208, 117, 117, 117),
                                  Color.fromARGB(255, 86, 84, 82),
                                  Color.fromARGB(255, 48, 48, 48),
                                ],
                              ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Publish",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp_bold",
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(),
            Positioned(
              right: 0.0,
              top: 5.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    canPublish = !canPublish;
                  });
                },
                child: Container(
                  height: 20.0,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.clear,
                      color: Colors.black,
                      size: 10.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
