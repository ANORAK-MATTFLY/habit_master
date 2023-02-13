import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

class RoutineCubit extends Cubit<Routine?> {
  RoutineCubit() : super(null);

  void updateState(Routine habit) => emit(habit);
}
