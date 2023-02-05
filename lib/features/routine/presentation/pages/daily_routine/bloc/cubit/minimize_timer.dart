import 'package:flutter_bloc/flutter_bloc.dart';

class MinimizeTimerCubit extends Cubit<bool> {
  MinimizeTimerCubit() : super(false);

  void updateState() => emit(!state);
}
