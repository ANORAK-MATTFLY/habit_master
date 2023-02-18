import 'package:cloud_firestore/cloud_firestore.dart';

class DateTimeManipulation {
  static List<String> getDaysOfTheWeek() {
    final now = Timestamp.now().toDate();
    final thisYear = now.year;
    final thisMonth = now.month;
    final toDay = now.day;
    final weekDay = now.weekday;
    const n = 7;
    final List<String> daysOfTheWeek = [];
    if (weekDay == 1) {
      for (var index = 1; index < n; index++) {
        final day = "$thisYear-$thisMonth-${toDay + index}";
        daysOfTheWeek.add(day);
      }
    } else {
      final leftSide = (weekDay - 1);

      final rightSide = ((n - weekDay) + 1);

      for (var index = leftSide; 0 < index; index--) {
        final day =
            "$thisYear-${thisMonth.toString().length == 1 ? '0$thisMonth' : thisMonth}-${toDay.toString().length == 1 ? '0${toDay - index}' : toDay - index}";
        daysOfTheWeek.add(day);
      }
      for (var index = 0; index < rightSide; index++) {
        final day =
            "$thisYear-${thisMonth.toString().length == 1 ? '0$thisMonth' : thisMonth}-${toDay.toString().length == 1 ? '0${toDay - index}' : toDay + index}";
        daysOfTheWeek.add(day);
      }
    }
    return daysOfTheWeek;
  }
}
