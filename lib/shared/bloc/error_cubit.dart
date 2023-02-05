import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMessageCubit extends Cubit<String> {
  ErrorMessageCubit() : super("");

  void updateState(message) => emit(message);
}
