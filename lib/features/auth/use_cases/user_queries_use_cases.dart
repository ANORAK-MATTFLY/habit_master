import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';
import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';

class UserQueriesUseCases {
  final UserRepository userRepository = serviceLocator<UserRepository>();
  Future<UserAggregate?> executeGetUserById(String userID) async {
    final UserAggregate user = await userRepository.getUserById(userID);
    return user;
  }
}
