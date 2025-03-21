import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/auth/infrastructure/data_sources/remote_data_source/user_queries.dart';
import 'package:habit_master/shared/static/images.dart';
import 'package:username_gen/username_gen.dart';

final random = Random();

class UserMutations {
  final _defaultAvatar = avatars[random.nextInt(avatars.length)];
  final usersCollection = RemoteDatabase.usersCollection;
  final userQueries = UserQueries();

  void createNewUser(GoogleSignInAccount currentUser) async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final userDocument = await UserQueries().getUserByID(id);
    if (!userDocument.exists) {
      insertUser(currentUser);
    }
  }

  Future<bool> insertUser(GoogleSignInAccount user) async {
    final userInfo = FirebaseAuth.instance.currentUser;
    final atUserName = UsernameGen.generateWith(
      data: UsernameGenData(
        names: ["@${user.displayName!}"],
        adjectives: [''],
      ),
      seperator: '',
    );
    try {
      await usersCollection.doc(userInfo!.uid).set(
        {
          "id": userInfo.uid,
          "email": user.email,
          "display_name": user.displayName,
          "photo_url": _defaultAvatar,
          "user_device_token": "",
          "@name": atUserName,
          "job_title": "",
          "followers": [],
          "following": [],
          "last_seen": Timestamp.now(),
        },
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  void setUserDeviceToken(UserInfo currentUser) async {
    await usersCollection.doc(currentUser.uid).update({
      "userDeviceId": "",
    });
  }
}
