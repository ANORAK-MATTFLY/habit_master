import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTimerCubit extends Cubit<bool> {
  ShowTimerCubit() : super(false);

  void updateState() => emit(!state);
}
