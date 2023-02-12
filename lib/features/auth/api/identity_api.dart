import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';

class IdentityApi {
  getAuthenticatedUser() {
    return UserRepository().getAuthenticatedUser();
  }

  Future<bool> isAuthenticated() {
    return UserRepository().isAuthenticated();
  }
}
