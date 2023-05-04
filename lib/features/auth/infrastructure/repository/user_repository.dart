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
  User? getAuthenticatedUser() {
    final user = UserQueries.getAuthenticatedUser();

    return user;
  }

  @override
  Future<bool> isAuthenticated() {
    return UserQueries.isAuthenticated();
  }

  @override
  Future<List<UserAggregate>> getUsers(List userIDs) async {
    final rawUsersData = await UserQueries().getUsers(userIDs);
    final List<UserAggregate> users = [];
    for (var index = 0; index < rawUsersData.docs.length; index++) {
      final rawUserData = rawUsersData.docs[index];
      final UserAggregate aggregate = UserAggregate.fromDocument(rawUserData);
      users.add(aggregate);
    }
    return users;
  }
}
