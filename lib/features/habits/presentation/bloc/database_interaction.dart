import 'package:flutter/foundation.dart';

import '../../models/habit_model.dart';

@immutable
abstract class DatabaseInteraction {
  final List<Habit>? habits;
  final bool? isRetrievedFromCache;

  const DatabaseInteraction({this.habits, this.isRetrievedFromCache});

  @override
  String toString() =>
      "isRetrievedFromCache: $isRetrievedFromCache, persons: $habits";
}
