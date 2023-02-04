import 'package:flutter_bloc/flutter_bloc.dart';

class TimeOptionCubit extends Cubit<String> {
  TimeOptionCubit() : super("Hours");

  void updateState(String newState) => emit(newState);
}
