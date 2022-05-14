part of 'login_cubit.dart';

class LoginState {
  Map? user;
  LoginState({@required this.user});
}

Map initialLoginState() {
  return {
    'email': '',
    'password': '',
  };
}
