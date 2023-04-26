import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/interfaces/timer_stream_interface.dart';

@immutable
class TimeStreamEvent implements TimerStreamBlocInterface {
  final int minutes;

  const TimeStreamEvent({required this.minutes}) : super();
}
