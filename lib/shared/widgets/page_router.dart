import 'package:flutter/material.dart';

import 'package:habit_master/features/routine/presentation/pages/navigation/bottom_app_bar.dart';
import 'package:habit_master/shared/logic/permission.dart';
import 'package:habit_master/shared/models/permission_model.dart';
import 'package:lottie/lottie.dart';

class PageRouter extends StatefulWidget {
  const PageRouter({Key? key}) : super(key: key);

  @override
  State<PageRouter> createState() => _PageRouterState();
}

class _PageRouterState extends State<PageRouter> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return FutureBuilder<Permission>(
      future: PermissionLogic().getPermission(),
      builder: (context, permissionSnapshot) {
        if (permissionSnapshot.data != null) {
          if (permissionSnapshot.data!.isFreePlan == 0) {
            return Material(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: height,
                width: width,
                color: const Color.fromARGB(255, 16, 1, 32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200.0,
                        child: Lottie.asset("assets/animations/smile.json"),
                      ),
                      const Text(
                        "Please update the app to get the latest features!",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Twitterchirp",
                          fontSize: 20.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Container(
                          height: 50.0,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Twitterchirp",
                                fontSize: 20.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
        }

        return const SuspendedBottomAppBar();
      },
    );
  }
}
