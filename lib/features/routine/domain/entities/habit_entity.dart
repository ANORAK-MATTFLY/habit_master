import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages

class HabitEntity extends Equatable {
  final String? id;
  final String? routineID;
  final String? habitName;
  final String? type;
  final String? scheduledFor;
  final String? duration;
  final String? expirationDate;
  final bool? isDone;
  final String? habitType;

  const HabitEntity({
    this.id,
    this.routineID,
    this.habitName,
    this.type,
    this.scheduledFor,
    this.duration,
    this.expirationDate,
    this.isDone,
    this.habitType,
  });

  @override
  List<Object> get props {
    return [
      id!,
      routineID!,
      habitName!,
      type!,
      scheduledFor!,
      duration!,
      expirationDate!,
      isDone!,
      habitType!,
    ];
  }
}
