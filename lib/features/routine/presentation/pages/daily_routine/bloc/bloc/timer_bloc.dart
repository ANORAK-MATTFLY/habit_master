// ignore_for_file: void_checks

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc_event/time_stream_event.dart';

import '../interfaces/timer_stream_interface.dart';

class StreamTimerBLoc extends Bloc<TimerStreamBlocInterface, Stream<String>?> {
  int total = 0;
  int secs = 0;
  StreamTimerBLoc() : super(null) {
    on<TimeStreamEvent>((event, emit) {
      emit(getTime(event.minutes).asBroadcastStream());
    });
  }

  Stream<String> getTime(int minutes) {
    total = minutes;
    return Stream.periodic(const Duration(seconds: 1), (count) {
      secs = DateTime.now().second;

      return "$secs";
    }).takeWhile((_) => total != 0);
  }
}
