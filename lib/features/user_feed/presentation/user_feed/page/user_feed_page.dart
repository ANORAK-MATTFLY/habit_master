import 'package:blur/blur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';
import 'package:habit_master/features/user_feed/infrastrcture/repository/post_repository.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/bloc/cubit/list_post.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/widgets/v1/post.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/widgets/v1/post_panel.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:habit_master/shared/widgets/dynamic_island.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserFeedPage extends StatefulWidget {
  const UserFeedPage({Key? key}) : super(key: key);

  @override
  State<UserFeedPage> createState() => _UserFeedPageState();
}

class _UserFeedPageState extends State<UserFeedPage> {
  bool showEditPanel = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: GestureDetector(
        onTap: () async {
          final isAuthenticated =
              await serviceLocator<IdentityApi>().isAuthenticated();
          if (!isAuthenticated) {
            // ignore: use_build_context_synchronously
            context.read<OnboardingCubit>().updateState();
            return;
          }

          setState(() {
            showEditPanel = !showEditPanel;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 60.0),
          height: 40.0,
          width: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 143, 255),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 216, 143, 255).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 20.0,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: const Icon(
              CupertinoIcons.quote_bubble_fill,
              size: 20.0,
            ).animate().slideY(
                  begin: -1,
                  duration: const Duration(milliseconds: 500),
                ),
          ),
        ).animate().slideY(
              begin: -0.3,
              duration: const Duration(milliseconds: 800),
            ),
      ),
      body: Stack(
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
            child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: serviceLocator<PostRepository>().postQueries.getPosts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        animating: true,
                        color: Colors.white,
                        radius: 15.0,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: GradientText(
                        "Please make sure you have internet connection",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp_Bold",
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        colors: const [
                          Color(0xCBB0D9F1),
                          Color(0xFF8E6AE4),
                        ],
                      ),
                    );
                  }
                  final rawPostsData = snapshot.data!.docs;
                  final List<Post> posts = [];
                  for (var i = 0; i < rawPostsData.length; i++) {
                    final rawPostData = rawPostsData[i];
                    final Post post = Post.fromDocument(rawPostData);
                    posts.add(post);
                  }
                  context.read<ListOfPostCubit>().updateState(posts);
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: posts.length,
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 40, bottom: 40.0),
                    itemBuilder: (BuildContext context, int index) {
                      final Post post = posts[index];
                      return Center(
                        child: PostWidget(post: post),
                      );
                    },
                  );
                }),
          ),
          BlocBuilder<StreamTimerBLoc, Stream<String>?>(
              buildWhen: (previous, current) {
            return previous != current;
          }, builder: (context, state) {
            if (state == null) {
              return const Center();
            }

            return StreamBuilder<String>(
                stream: state,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center();
                  }

                  if (snapshot.data == "59") {
                    context.read<MinutesCounterCubit>().updateState();
                  }
                  if (context.read<MinutesCounterCubit>().state >=
                      context.read<MinutesCubit>().state) {
                    context.read<TimerControllerCubit>().updateState();
                    return const Center();
                  }

                  final String remainingTime = snapshot.data!;
                  return DynamicIsland(
                      remainingTime:
                          "${context.read<MinutesCounterCubit>().state} : $remainingTime");
                });
          }),
          Visibility(
            visible: showEditPanel,
            child: const Center(
              child: EditPostPanel(),
            ),
          ),
        ],
      ),
    );
  }
}
