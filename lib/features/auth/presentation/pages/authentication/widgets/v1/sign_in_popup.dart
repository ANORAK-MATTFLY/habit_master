import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/leader_board/infrastructure/models/leader.dart';
import 'package:habit_master/features/leader_board/infrastructure/repository/leader_repository.dart';
import 'package:habit_master/features/routine/domain/logic/get_days_of_the_week.dart';
import 'package:habit_master/features/routine/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_author.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_author.dart';
import 'package:lottie/lottie.dart';

import 'package:show_up_animation/show_up_animation.dart';

import '../../../../../../../shared/bloc/auth_cubit.dart';
import '../../../../../domain/logic/google_auth.dart';
import '../../bloc/cubit/sign_in_cubit.dart';

class SignInPopup extends StatefulWidget {
  const SignInPopup({Key? key}) : super(key: key);
  @override
  State<SignInPopup> createState() => _SignInPopupState();
}

class _SignInPopupState extends State<SignInPopup>
    with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1400), vsync: this)
      ..upperBound
      ..reverse(from: 1);

    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.5)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticIn),
    );
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SlideTransition(
      transformHitTests: true,
      position: _offsetAnimation,
      child: ShowUpAnimation(
        animationDuration: const Duration(milliseconds: 200),
        delayStart: const Duration(milliseconds: 0),
        curve: Curves.decelerate,
        direction: Direction.vertical,
        offset: 0.2,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: (height - 140.0),
            width: (width - 30.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: (height - 200.0),
                    width: (width - 30.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(96, 0, 0, 0),
                          spreadRadius: 10,
                          blurRadius: 25.0,
                          offset: Offset(2, 9), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 231, 208),
                            fontFamily: "Twitterchirp_Bold",
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                          width: (width - 70.0),
                          child: const Center(
                            child: Text(
                              "Become a productivity guru",
                              style: TextStyle(
                                color: Color.fromARGB(255, 33, 1, 57),
                                fontFamily: "Twitterchirp_Bold",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 200,
                            width: double.infinity,
                            child:
                                Lottie.asset("assets/animations/guru2.json")),
                        const Center(
                          child: Text(
                            "Sign in with Google",
                            style: TextStyle(
                              color: Color.fromARGB(255, 45, 45, 45),
                              fontFamily: "Twitterchirp",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              context.read<AuthCubit>().updateState(true);
                              final loginSucceeded =
                                  await GoogleAuth().loginWithGoogle();
                              if (loginSucceeded == true) {
                                final userInfo =
                                    IdentityApi().getAuthenticatedUser();

                                // ignore: unnecessary_null_comparison
                                if (userInfo != null) {
                                  final user = await IdentityApi()
                                      .getUserById(userInfo.uid);
                                  final Author author = Author(
                                    authorProfilePicture: user!.photoUrl,
                                    authorName: user.displayName,
                                    id: userInfo.uid,
                                    type: "costumer",
                                  );
                                  final leaderRoomID =
                                      DateTimeManipulation.getDaysOfTheWeek();

                                  final Leader leader = Leader(
                                    leaderRoomID: "$leaderRoomID",
                                    id: user.userID,
                                    leaderName: user.displayName,
                                    profilePicture: user.photoUrl,
                                    score: 0,
                                  );

                                  await serviceLocator<LeaderRepository>()
                                      .leaderMutations
                                      .createLeaderDocument(leader);

                                  // ignore: use_build_context_synchronously
                                  context.read<CreateAuthorBlocLogic>().add(
                                        CreateAuthorAction(author: author),
                                      );
                                }
                                // ignore: use_build_context_synchronously
                                context.read<AuthCubit>().updateState(false);
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 215, 133),
                                  content: Text(
                                    "Welcome to Habit Master!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  duration: Duration(seconds: 3),
                                ));
                              }
                            },
                            child: Container(
                              height: 70.0,
                              width: 250.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 159, 159, 159),
                                    spreadRadius: -13,
                                    blurRadius: 30.0,
                                    offset: Offset(
                                        2, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50.0,
                                    child:
                                        Image.asset("assets/images/google.png"),
                                  ),
                                  const Text(
                                    "Sign in with Google",
                                    style: TextStyle(fontSize: 17.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          spreadRadius: -20,
                          blurRadius: 30.0,
                          offset: Offset(2, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(360.0),
                            ),
                            child: Container(
                              color: Colors.black,
                              width: 20.0,
                              height: 20.0,
                            ),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () =>
                                context.read<SignInCubit>().updateState(),
                            icon: const Icon(
                              Icons.cancel_rounded,
                              size: 35.0,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
