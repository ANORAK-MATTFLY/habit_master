import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';
import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v1/circle_avatar.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/shared/static/colors.dart';

// ignore: must_be_immutable
class LikedBySection extends StatefulWidget {
  Post? post;
  LikedBySection({Key? key, required this.post}) : super(key: key);

  @override
  State<LikedBySection> createState() => _LikedBySectionState();
}

class _LikedBySectionState extends State<LikedBySection> {
  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Liked by",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 60.0,
          width: 100.0,
          child: FutureBuilder<List<UserAggregate>>(
              future: serviceLocator<UserRepository>().getUsers(post!.likes!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CupertinoActivityIndicator(
                    animating: true,
                    color: Colors.white,
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  final rawUserData = snapshot.data!;
                  return Stack(
                      children: rawUserData.map((user) {
                    final List<double> positions = [10.0, 25.0, 35.0];
                    return Positioned(
                      top: 25.0,
                      left: positions[rawUserData.indexOf(user)],
                      child: tinyCircleAvatar(
                        user.photoUrl!,
                        [
                          stackedAvatarColors[rawUserData.indexOf(user)],
                          stackedAvatarColors[rawUserData.indexOf(user)],
                        ],
                      ),
                    );
                  }).toList());
                }
                return const Center();
              }),
        ),
      ],
    );
  }
}
