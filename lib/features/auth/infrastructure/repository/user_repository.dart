import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/features/auth/infrastructure/data_sources/remote_data_source/user_queries.dart';

class UserRepository {
  Future<DocumentSnapshot<Object?>> getUserById(String userID) {
    return UserQueries().getUserByID(userID);
  }

  Future<User?> getAuthenticatedUser() {
    return UserQueries.getAuthenticatedUser();
  }

  Future<bool> isAuthenticated() {
    return UserQueries.isAuthenticated();
  }
}
