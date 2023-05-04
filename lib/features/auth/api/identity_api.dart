import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';
import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';
import 'package:habit_master/features/auth/use_cases/user_queries_use_cases.dart';

class IdentityApi {
  User? getAuthenticatedUser() {
    final user = UserRepository().getAuthenticatedUser();

    return user;
  }

  Future<bool> isAuthenticated() {
    return UserRepository().isAuthenticated();
  }

  Future<UserAggregate?> getUserById(String userID) {
    return UserQueriesUseCases().executeGetUserById(userID);
  }
}
