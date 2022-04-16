import 'package:bloc/bloc.dart';
import 'package:habit_master/data/models/autentication.model.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(user: authenticationModel()));

  void onCheckUserAuth() async {}
  void onLoginWithGoogle() async {}
  void onLoginWithFacebook() async {}
  void onLoginWithEmailAndPassword() async {}
}
