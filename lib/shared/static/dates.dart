import 'package:cloud_firestore/cloud_firestore.dart';

final year = DateTime.now().year;
final month = DateTime.now().month;
final day = DateTime.now().day + 1;

final expirationDate =
    "$year-${month.toString().length < 2 ? "0$month" : month}-${day.toString().length < 2 ? "0$day" : day} 00:00:00";
final String doneDate = Timestamp.now().toDate().toString().split(" ")[0];
