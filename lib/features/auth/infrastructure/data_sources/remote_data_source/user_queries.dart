import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/core/db/remote_db.dart';

class UserQueries {
  Future<DocumentSnapshot<Object?>> getUserByID(String userID) async {
    try {
      DocumentSnapshot userInDocument =
          await RemoteDatabase.usersCollection.doc(userID).get();
      return userInDocument;
    } catch (error) {
      rethrow;
    }
  }

  static Future<User?> getAuthenticatedUser() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser;
  }

  static Future<bool> isAuthenticated() async {
    final User? user = await getAuthenticatedUser();
    return user != null;
  }
}
