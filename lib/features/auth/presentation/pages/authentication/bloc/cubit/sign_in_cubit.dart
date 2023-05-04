import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<bool> {
  SignInCubit() : super(false);

  void updateState() => emit(!state);
}
