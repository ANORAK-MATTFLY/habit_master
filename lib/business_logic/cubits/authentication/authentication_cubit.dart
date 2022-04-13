import 'package:bloc/bloc.dart';
import 'package:habit_master/data/models/autentication.model.dart';
import 'package:meta/meta.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(AuthenticationState(user: authenticationModel()));

  void onCheckUserAuth() async {}
  void onLoginWithGoogle() async {}
  void onLoginWithFacebook() async {}
  void onLoginWithEmailAndPassword() async {}
}
