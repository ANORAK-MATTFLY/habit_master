import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';

abstract class UserRemoteDataInterface {
  Future<UserAggregate> getUserById(String userID);
  User getAuthenticatedUser();
  Future<bool> isAuthenticated();
}
