import 'package:flutter_bloc/flutter_bloc.dart';

class TimerControllerCubit extends Cubit<bool> {
  TimerControllerCubit() : super(true);

  void updateState() => emit(!state);
}
