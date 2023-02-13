import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';

class IdentityApi {
  User getAuthenticatedUser() {
    return UserRepository().getAuthenticatedUser();
  }

  Future<bool> isAuthenticated() {
    return UserRepository().isAuthenticated();
  }
}
