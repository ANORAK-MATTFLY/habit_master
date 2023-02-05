import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/shared/bloc/error_cubit.dart';
import 'package:habit_master/shared/bloc/show_error_cubit.dart';

class ErrorPanel extends StatelessWidget {
  const ErrorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final String errorMessage = context.read<ErrorMessageCubit>().state;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(197, 29, 4, 39),
              Color.fromARGB(255, 29, 1, 40),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: const Blur(
              blur: 10,
              colorOpacity: 0.1,
              blurColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 165.0,
              width: width - 30.0,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150.0,
                      width: width - 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF747474),
                            style: BorderStyle.solid,
                            width: 0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: const Color.fromARGB(255, 22, 3, 36),
                      ),
                      child: Center(
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Twitterchirp",
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(360.0),
                          ),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 124, 124, 124),
                                Color.fromARGB(255, 36, 36, 36),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.0, 0.8],
                              tileMode: TileMode.clamp),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              context.read<ShowErrorCubit>().updateState(false);
                              context.read<ErrorMessageCubit>().updateState("");
                            },
                            icon: const Icon(
                              CupertinoIcons.clear,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ).animate().shake(),
          ),
        ],
      ),
    );
  }
}
