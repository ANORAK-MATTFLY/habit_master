import 'package:flutter/foundation.dart';

@immutable
class TimerStreamState {
  final String remainingTime;

  const TimerStreamState({required this.remainingTime});
}
