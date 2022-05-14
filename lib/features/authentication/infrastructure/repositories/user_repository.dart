import 'package:habit_master/common/platform/connectivity.dart';
import 'package:habit_master/features/authentication/domain/interfaces/user_interface.dart';
import 'package:habit_master/features/authentication/infrastructure/data_sources/user_local_data_provider.dart';
import 'package:habit_master/features/authentication/infrastructure/data_sources/user_remote_data_provider.dart';
import 'package:habit_master/features/authentication/infrastructure/models/user_model.dart';
import 'package:meta/meta.dart';

class UserRepository implements UserInterface {
  UserRepository({
    @required this.connectivity,
    @required this.userLocalDataProvider,
    @required this.userRemoteDataProvider,
  });

  final Connectivity? connectivity;
  final UserLocalDataProvider? userLocalDataProvider;
  final UserRemoteDataProvider? userRemoteDataProvider;

  @override
  Future<UserModel?> loginWithEmailAndPassword() async {
    if (connectivity!.isConnected) {
      try {
        final bool? checkUserAuth =
            await userLocalDataProvider!.checkUserAuth();
        if (checkUserAuth!) {
          final UserModel? user = await userLocalDataProvider!.getUserInfos();
          return user;
        }

        // User Not Found On Local Storage: Get Remote Data
        final UserModel? user = await userRemoteDataProvider!.loginWithGoogle();
        return user;
      } catch (error) {
        // Todo: Common Exceptions
        return null;
      }
    } else {
      final UserModel? user = await userLocalDataProvider!.getUserInfos();
      return user;
    }
  }

  @override
  Future<UserModel?> loginWithFacebook() async {
    if (connectivity!.isConnected) {
      try {
        final UserModel? user =
            await userRemoteDataProvider!.loginWithFacebook();
        return user;
      } catch (error) {
        // TODO: Common Exceptions
        return null;
      }
    } else {
      // TODO: Common Exceptions: No Internet
      return null;
    }
  }

  @override
  Future<UserModel?> loginWithGoogle() async {
        if (connectivity!.isConnected) {
      try {
        final UserModel? user =
            await userRemoteDataProvider!.loginWithGoogle();
        return user;
      } catch (error) {
        // TODO: Common Exceptions
        return null;
      }
    } else {
      // TODO: Common Exceptions: No Internet
      return null;
    }
  }
}
