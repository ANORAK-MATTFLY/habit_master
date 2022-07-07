import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPopupCubit extends Cubit<bool> {
  SignInPopupCubit() : super(false);

  void updateState() => emit(!state);
}
