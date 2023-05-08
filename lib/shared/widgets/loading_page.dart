import 'package:flutter/material.dart';
import 'package:habit_master/shared/widgets/page_router.dart';
import 'package:lottie/lottie.dart';

import '../../features/routine/domain/logic/prebuilt_data.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return FutureBuilder<bool>(
        future: PrebuiltData().createPrebuiltData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return const PageRouter();
          }
          if (snapshot.hasData) {
            return const PageRouter();
          }

          return Container(
            height: height,
            width: width,
            color: Color.fromARGB(255, 19, 3, 33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/animations/loading_3.json"),
                ),
                Text(
                  "Searching for daily routines...",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp",
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
