import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/pages/daily_routine_page.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'dart:math';

import '../../../../../../../shared/static/images.dart';

// ignore: must_be_immutable
class SmallCard extends StatefulWidget {
  List<Routine> routines;
  SmallCard({Key? key, required this.routines}) : super(key: key);

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    final routines = widget.routines;
    return Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 30,
        children: routines.map((routine) {
          final cardPositionIsOdd = routines.indexOf(routine).isEven;
          return GestureDetector(
            onTap: () async {
              context.read<RoutineCubit>().updateState(routine);
              final isAuthenticated =
                  await serviceLocator<IdentityApi>().isAuthenticated();
              if (!isAuthenticated) {
                // ignore: use_build_context_synchronously
                context.read<OnboardingCubit>().updateState();
                return;
              }

              // ignore: use_build_context_synchronously
              context.read<RoutineCubit>().updateState(routine);

              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DailyRoutinePage(),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  width: 140.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF747474),
                        style: BorderStyle.solid,
                        width: 0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: cardPositionIsOdd
                            ? const Color(0xFF8044A3).withOpacity(0.2)
                            : const Color(0xFF2E75A9).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: const Offset(2, 9),
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: cardPositionIsOdd
                            ? [
                                const Color(0xFF70F0D4).withOpacity(0.6),
                                const Color(0xFF4EBFF3).withOpacity(0.6),
                              ]
                            : [
                                const Color(0xFF1C628A).withOpacity(0.6),
                                const Color(0xFFB082E4).withOpacity(0.6)
                              ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.0, 0.8],
                        tileMode: TileMode.clamp),
                  ),
                ),
                const Positioned(
                  right: 0.0,
                  child: SizedBox(
                    width: 140.0,
                    height: 200.0,
                    child: Blur(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      blur: 10,
                      colorOpacity: 0.1,
                      blurColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  width: 140.0,
                  height: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100.0,
                        width: 200.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 0.0,
                              child: Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      objectsD[random.nextInt(objectsD.length)],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0.0,
                              top: 2.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(360),
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: AssetImage(
                                        routine.authorProfilePicture!),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${routine.authorName}'s Daily Routine",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp_Bold",
                            fontSize: 12.0),
                      ),
                      const SizedBox(height: 12.0),
                      const Text(
                        "Community's daily routine",
                        style: TextStyle(
                          fontFamily: "Twitterchirp",
                          color: Color(0xB7FFFFFF),
                          fontSize: 10.0,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: LinearProgressIndicator(
                            minHeight: 5.0,
                            value: 0.2,
                            color: Colors.white,
                            backgroundColor: Color(0xFF3B2D73),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList());
  }
}
