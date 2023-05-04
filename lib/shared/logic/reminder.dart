import 'dart:isolate';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habit_master/shared/notifications.dart';

class Reminder {
  sendReminder() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_sendP, receivePort.sendPort);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    final actionMessage = await receivePort.first;
    // ignore: unrelated_type_equality_checks
    if (actionMessage == "run") {
      return NotificationService.showBigTextNotification(
        title: "Habit Master",
        body: "You need to stick to your habits!",
        fln: flutterLocalNotificationsPlugin,
      );
    }
  }

  _sendP(SendPort sendPort) async {
    final data = await Future.delayed(const Duration(hours: 3), () {
      return "run";
    });
    Isolate.exit(sendPort, data);
  }
}
