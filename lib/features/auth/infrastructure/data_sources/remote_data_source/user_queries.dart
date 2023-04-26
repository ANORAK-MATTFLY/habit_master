import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';

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

  static User? getAuthenticatedUser() {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    }
    final User currentUser = FirebaseAuth.instance.currentUser!;
    return currentUser;
  }

  static Future<bool> isAuthenticated() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    final User user = FirebaseAuth.instance.currentUser!;
    final userData =
        await serviceLocator<AuthorRepository>().getCachedAuthor(user.uid);
    if (userData == null) {
      return false;
    }
    return true;
  }

  Future<QuerySnapshot<Object?>> getUsers(List userIDs) async {
    final rawUsersData = await RemoteDatabase.usersCollection
        .where("id", whereIn: userIDs)
        .get();
    return rawUsersData;
  }
}
