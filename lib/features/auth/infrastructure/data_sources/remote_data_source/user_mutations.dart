import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/features/auth/infrastructure/data_sources/remote_data_source/user_queries.dart';
import 'package:habit_master/shared/static/images.dart';

final random = Random();

class UserMutations {
  final _defaultAvatar = avatars[random.nextInt(avatars.length)];
  final usersCollection = RemoteDatabase.usersCollection;
  final userQueries = UserQueries();

  void createNewUser(GoogleSignInAccount currentUser) async {
    final userDocument = await UserQueries().getUserByID(currentUser.id);
    if (!userDocument.exists) {
      insertUser(currentUser);
    }
  }

  Future<bool> insertUser(GoogleSignInAccount user) async {
    try {
      await usersCollection.doc(user.id).set(
        {
          "id": user.id,
          "email": user.email,
          "displayName": user.displayName,
          "photoUrl": user.photoUrl ?? _defaultAvatar,
          "userDeviceToken": null,
          "job_title": "",
          "followers": [],
          "following": [],
          "lastSeen": Timestamp.now(),
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
