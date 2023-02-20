import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_master/features/auth/domain/interfaces/remote_user_interface.dart';
import 'package:habit_master/features/auth/infrastructure/data_sources/remote_data_source/user_queries.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';

class UserRepository implements UserRemoteDataInterface {
  @override
  Future<UserAggregate> getUserById(String userID) async {
    final userSnapshot = await UserQueries().getUserByID(userID);
    final UserAggregate user = UserAggregate.fromDocument(userSnapshot);
    return user;
  }

  @override
  User getAuthenticatedUser() {
    return UserQueries.getAuthenticatedUser();
  }

  @override
  Future<bool> isAuthenticated() {
    return UserQueries.isAuthenticated();
  }
}
