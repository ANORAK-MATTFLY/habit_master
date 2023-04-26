import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/user_feed/infrastrcture/data/remote_data_source/mutations/post_mutations.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:like_button/like_button.dart';

class LikeIcon extends StatefulWidget {
  final Post post;
  const LikeIcon({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  Widget build(BuildContext context) {
    final userInfo = serviceLocator<IdentityApi>().getAuthenticatedUser();
    final post = widget.post;
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      final isAuthenticated =
          await serviceLocator<IdentityApi>().isAuthenticated();
      if (!isAuthenticated) {
        // ignore: use_build_context_synchronously
        context.read<OnboardingCubit>().updateState();
        return false;
      }

      /// send your request here
      PostMutations().like(post.id!, userInfo!.uid);

      /// if failed, you can do nothing
      return !isLiked;
    }

    return LikeButton(
      onTap: onLikeButtonTapped,
      size: 15.0,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      isLiked: userInfo == null ? false : post.likes!.contains(userInfo.uid),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: userInfo == null
              ? Colors.white
              : isLiked
                  ? Colors.red
                  : Colors.white,
          size: 15.0,
        );
      },
      likeCount: widget.post.likes!.length,
    );
  }
}
