import 'package:habit_master/features/routine/domain/entities/habit_entity.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:uuid/uuid.dart';

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

  // ignore: overridden_fields
  final String? habitType;

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
    this.habitType,
  });
  factory Habit.fromDocument(dynamic doc) {
    return Habit(
      id: doc["id"],
      routineID: doc["routine_id"],
      habitName: doc["habit_name"],
      type: doc["type"],
      scheduledFor: doc["scheduled_for"],
      duration: doc["duration"],
      expirationDate: doc["expiration_date"],
      isDone: doc["is_done"],
      doneOn: doc["done_on"],
      habitType: doc["habit_type"],
    );
  }

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
        habitType: json['habit_type'] as String?,
      );
}

const uuid = Uuid();

final List<Habit> elon = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Wake up at 7 am.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Drink water.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Take a shower.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Skip breakfast.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Have a cope coffee.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Work for 12 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Dinner between 7-6 PM",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "afternoon.",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Meditate for 30 min.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "evening",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Read for 30 min.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Elon MuskElon MuskElon MuskElon MuskElon MuskElon Musk 2",
    habitName: "Sleep around 11-12 PM (6-7 hours of sleep).",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> billGate = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Wake up at 6:30.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Brush my teeth.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "60-min",
    scheduledFor: "morning",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Work out for 1 hour.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "60-min",
    scheduledFor: "morning",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Read for an hour.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Work for 8 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "60-min",
    scheduledFor: "afternoon",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "1 hour break (rest no phone & computer.)",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Meeting with the staff.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Dinner with family.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "120-min",
    scheduledFor: "evening",
    routineID: "Bill GateBill GateBill GateBill GateBill GateBill Gate",
    habitName: "Read for 2 hours",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> lewis = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Wake up at 7 PM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Drink a big glass of water.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Stretch up.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "20-min",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "20min meditation.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "30min run.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Take a shower.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "120-min",
    scheduledFor: "afternoon",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "2 hours weight lifting.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "120-min",
    scheduledFor: "afternoon",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Muay Thai for 2 hours.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "I Eat dinner(No meat no fish, all vegan).",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "45-min",
    scheduledFor: "evening",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "45min meditation.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Keep in touch with friends.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "lewis lewis lewis lewis lewis lewis lewis lewis lewis lewis",
    habitName: "Bedtime.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> jamesClear = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Wake up at 7 AM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Take a shower.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Drink a glass of water.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Skip breakfast (intermittent fasting).",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Write down three things I’m grateful for.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Read twenty pages of a book.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Work 8 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Exercise between 6-7 PM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Eat my only meal between 7-8 PM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Get ready for the next day.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "clear james clear james clear james clear james clear james clear",
    habitName: "Head to bed at around 10:30-11 pm.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> cuban = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Wake up at 6.30 am.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Read E-mails.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Brush my teeth.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Layout the most important tasks for the day.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "reading the news.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Drop the kids at school.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Playing a little basketball.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Work 8 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "10-min",
    scheduledFor: "afternoon",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "E-mails 10min.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Cardio Exercise.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Mark Cuban Mark CubanMark CubanMark CubanMark CubanMark CubanMark Cuban",
    habitName: "Sleep at 11 PM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> oprah = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Wake up at 7:23.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Walk with the dog. 🐕",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Take a cup of coffee. ☕",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "meditation for 30min 🧘",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "20-min",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Workout for 20min 🏃‍♀️",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Work for 8h.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Eat dinner around 6 PM.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Read a book for 2 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Mediate (What are you grateful for?).",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah Oprah",
    habitName: "Sleep for 5h or 6h.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> timCook = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Wake up at 3:45 AM",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Take a shower",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Work for 2 hours",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Check my emails",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Breakfast (two scrambled egg whites, bacon).",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "60-min",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "One-hour workout.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Work for 7 Hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Rest & dinner at around 6-7 PM",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "20min meditation.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Read for 2 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook Cook",
    habitName: "Prepare for the next day.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> satya = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Wakes up at 7 am.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "morning",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "30min run 🏃",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Work for 8 or 9 hours.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Meeting with the staff.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Spend time with family.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "read 40 pages of a book",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Meditate 🧘‍♂️",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID:
        "Satya Nadella Satya Nadella Satya Nadella Satya Nadella Satya Nadella",
    habitName: "Prepare for the next day.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];

final List<Habit> jack = [
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "morning",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Wake up at 6:15 am.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "60-min",
    scheduledFor: "morning",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "1 hour meditation.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "morning",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Take a walk for 30.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    scheduledFor: "morning",
    duration: "",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Work for 8h.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "afternoon",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Eat your only meal between 5-6 PM (OMAD diet)",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "15-min",
    scheduledFor: "afternoon",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Read 15 min.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "15-min",
    scheduledFor: "evening",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "15min in a barrel sauna.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Take an ice bath 3 min blocks for an hour.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "30-min",
    scheduledFor: "evening",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "30min meditation.",
    type: "timer",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
  Habit(
    id: "${uuid.v1()}-${DateTime.now().microsecond.toString()}-",
    duration: "",
    scheduledFor: "evening",
    routineID: "Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey Jack Dorsey",
    habitName: "Plan the next day.",
    type: "check",
    isDone: false,
    expirationDate: expirationDate,
    doneOn: "",
    habitType: "local",
  ),
];
