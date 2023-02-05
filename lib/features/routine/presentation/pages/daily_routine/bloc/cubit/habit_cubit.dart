import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class HabitCubit extends Cubit<Routine?> {
  HabitCubit() : super(null);

  void updateState(Routine habit) => emit(habit);
}
