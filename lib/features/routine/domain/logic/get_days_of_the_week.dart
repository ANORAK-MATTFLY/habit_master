import 'package:cloud_firestore/cloud_firestore.dart';

class DateTimeManipulation {
  static String todaysDate = Timestamp.now().toDate().toString().split(" ")[0];
  static List<String> getDaysOfTheWeek() {
    final now = Timestamp.now().toDate();

    final weekDay = now.weekday;
    const n = 7;
    final List<String> daysOfTheWeek = [];
    if (weekDay == 1) {
      for (var index = 1; index <= 7; index++) {
        final lastDateOfTheWeek = Timestamp.now().toDate().add(
            Duration(days: (index - Timestamp.now().toDate().weekday).abs()));
        daysOfTheWeek.add(lastDateOfTheWeek.toString().split(" ")[0]);
      }
    } else {
      final leftSide = (weekDay - 1);

      final rightSide = ((n - weekDay).abs() + 1);

      for (var index = leftSide; 0 <= index; index--) {
        final lastDateOfTheWeek =
            Timestamp.now().toDate().subtract(Duration(days: index));
        daysOfTheWeek.add(lastDateOfTheWeek.toString().split(" ")[0]);
      }
      for (var index = 1; index < rightSide; index++) {
        final lastDateOfTheWeek =
            Timestamp.now().toDate().add(Duration(days: index));
        daysOfTheWeek.add(lastDateOfTheWeek.toString().split(" ")[0]);
      }
    }
    return daysOfTheWeek;
  }
}
