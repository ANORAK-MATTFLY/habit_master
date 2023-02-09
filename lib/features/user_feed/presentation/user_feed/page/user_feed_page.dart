import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/widgets/post.dart';

class UserFeedPage extends StatefulWidget {
  const UserFeedPage({Key? key}) : super(key: key);

  @override
  State<UserFeedPage> createState() => _UserFeedPageState();
}

class _UserFeedPageState extends State<UserFeedPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 19, 2, 28),
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              alignment: Alignment.center,
              opacity: 0.7,
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: (height),
          child: const Blur(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            blur: 60,
            colorOpacity: 0.0,
            blurColor: Color.fromARGB(0, 95, 95, 95),
            child: Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 3,
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 40, bottom: 40.0),
            itemBuilder: (BuildContext context, int index) {
              return const Center(child: PostWidget());
            },
          ),
        ),
      ],
    );
  }
}
