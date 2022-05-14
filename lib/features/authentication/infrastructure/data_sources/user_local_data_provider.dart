import 'package:habit_master/features/authentication/infrastructure/models/user_model.dart';

class UserLocalDataProvider {
  Future<bool?> checkUserAuth() async {
    // Check If User Already Authenticated
    return null;
  }

  Future<UserModel?> getUserInfos() async {
    // Get User Infos On Local Storage
    return null;
  }

  Future<UserModel?> disconnectUser() async {
    // Remove All User Infos On Local Storage
    return null;
  }
}
