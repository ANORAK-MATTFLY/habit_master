import 'package:habit_master/features/routine/domain/entities/habit_entity.dart';

class Habit extends HabitEntity {
  @override
  // ignore: overridden_fields
  final String? id;

  @override
  // ignore: overridden_fields
  final String? routineID;
  @override
  // ignore: overridden_fields
  final String? habitName;
  @override
  // ignore: overridden_fields
  final String? type;
  @override
  // ignore: overridden_fields
  final String? scheduledFor;
  @override
  // ignore: overridden_fields
  final String? duration;
  @override
  // ignore: overridden_fields
  final String? expirationDate;
  // ignore: overridden_fields
  final String? doneOn;
  @override
  // ignore: overridden_fields
  final bool? isDone;

  const Habit({
    this.id,
    this.routineID,
    this.habitName,
    this.type,
    this.scheduledFor,
    this.duration,
    this.expirationDate,
    this.isDone,
    this.doneOn,
  });

  static Habit fromJson(Map<String, Object?> json) => Habit(
        id: json['id'] as String?,
        routineID: json['routine_id'] as String?,
        habitName: json['habit_name'] as String?,
        type: json['type'] as String?,
        scheduledFor: json['scheduled_for'] as String?,
        duration: json['duration'] as String?,
        expirationDate: json['expiration_date'] as String?,
        isDone: json['is_done'] == 1 ? true : false,
        doneOn: json['done_on'] as String?,
      );
}
