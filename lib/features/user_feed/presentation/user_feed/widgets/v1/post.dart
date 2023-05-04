import 'dart:math';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/side_line.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/widgets/v2/like_button.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/widgets/v2/liked_by_section.dart';
import 'package:habit_master/shared/static/colors.dart';

// ignore: must_be_immutable
class PostWidget extends StatefulWidget {
  Post post;
  PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final random = Random();
    final color = colors[random.nextInt(colors.length)];
    final Post post = widget.post;
    final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: width,
        height: (250.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: width,
                height: (240.0),
                child: Blur(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  blur: 60,
                  colorOpacity: 0.1,
                  blurColor: color.withOpacity(0.1),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 240.0,
                    width: (width - 20),
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 230.0,
                          width: (width - 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sideLine(color, height: 200),
                              SizedBox(
                                  height: 220.0,
                                  width: (width - 80),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 40.0,
                                            width: 200.0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 35.0,
                                                  width: 35.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: color,
                                                      width: 1.0,
                                                      style: BorderStyle.solid,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(360.0),
                                                    ),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(post
                                                          .ownerProfilePicture!),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 25.0,
                                                  width: 150.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        color.withOpacity(0.4),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      post.ownerName!.length >
                                                              10
                                                          ? post.ownerName!
                                                              .substring(0, 8)
                                                          : post.ownerName!,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 5.0,
                                              right: 5.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: color.withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                post.type!,
                                                style: TextStyle(
                                                  color: color,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 170.0,
                                        width: (width - 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              post.textContent!.length > 100
                                                  ? post.textContent!
                                                      .substring(0, 240)
                                                  : post.textContent!,
                                              style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  color: Colors.white),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: SizedBox(
                                                height: 60.0,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 60.0,
                                                      width: 180.0,
                                                      child: LikedBySection(
                                                          post: post),
                                                    ),
                                                    SizedBox(
                                                        // color: Colors.green,
                                                        height: 60.0,
                                                        width: 100.0,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          20.0),
                                                              child: Container(
                                                                height: 30.0,
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: color
                                                                      .withOpacity(
                                                                          0.1),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            360),
                                                                  ),
                                                                ),
                                                                child: LikeIcon(
                                                                  post: post,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 25.0,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: color,
                      ),
                      child: Center(
                        child: Text(
                          "${days[post.createdAt!.toDate().weekday - 1]}, ${post.createdAt!.toDate().hour} : ${post.createdAt!.toDate().minute}, ${post.createdAt!.toDate().year}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Twitterchirp",
                            fontSize: 11.0,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .slideY(
                          begin: -0.4,
                          duration: const Duration(milliseconds: 400),
                        )
                        .then()
                        .slide(
                          begin: const Offset(-0.2, 0),
                          duration: const Duration(milliseconds: 700),
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
