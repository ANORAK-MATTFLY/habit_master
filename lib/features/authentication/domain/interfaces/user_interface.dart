import 'package:habit_master/features/authentication/infrastructure/models/user_model.dart';

abstract class UserInterface {
  Future<UserModel?> loginWithEmailAndPassword();
  Future<UserModel?> loginWithGoogle();
  Future<UserModel?> loginWithFacebook();
}
