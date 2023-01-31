import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAddHabitPanelCubit extends Cubit<bool> {
  ShowAddHabitPanelCubit() : super(false);

  void updateState() => emit(!state);
}
