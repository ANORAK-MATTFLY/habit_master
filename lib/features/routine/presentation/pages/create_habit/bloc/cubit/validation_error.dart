import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationErrorCubit extends Cubit<String> {
  ValidationErrorCubit() : super("");

  void updateState(String newState) => emit(newState);
}
