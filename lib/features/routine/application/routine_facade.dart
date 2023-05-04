import 'package:habit_master/features/routine/infrastructure/repository/author_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/infrastructure/repository/routine_repository.dart';

class RoutineFacadeService {
  const RoutineFacadeService({
    required this.authorRepository,
    required this.routineRepository,
    required this.habitRepository,
  });

  final AuthorRepository authorRepository;

  final RoutineRepository routineRepository;

  final HabitRepository habitRepository;
}
