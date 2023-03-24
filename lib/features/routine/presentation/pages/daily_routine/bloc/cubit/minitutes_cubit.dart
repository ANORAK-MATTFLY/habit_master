import 'package:flutter_bloc/flutter_bloc.dart';

class MinutesCubit extends Cubit<int> {
  MinutesCubit() : super(1);
  void setMinute(int minute) => emit(minute);
  void updateState() => emit(state + 1);
}

class MinutesCounterCubit extends Cubit<int> {
  MinutesCounterCubit() : super(0);
  void setMinute(int minute) => emit(minute);

  void updateState() => emit(state + 1);
}
