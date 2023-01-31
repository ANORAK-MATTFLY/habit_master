import 'package:flutter_bloc/flutter_bloc.dart';

class TimerTaskCubit extends Cubit<bool> {
  TimerTaskCubit() : super(false);

  void updateState(newState) => emit(newState);
}
