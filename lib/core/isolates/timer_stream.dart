import 'dart:async';
import 'dart:isolate';

import 'package:stream_isolate/stream_isolate.dart';

class StreamTimer {
  int total = 1;
  int secs = 0;

  Stream<String> getTime() {
    return Stream.periodic(const Duration(seconds: 1), (count) {
      secs += 1;
      if (secs == 60) {
        total = total - 1;
        secs = 0;
      }
      return "$total : $secs";
    }).takeWhile((_) => total != -1);
  }
  // _streamController.sink.add(d);

  final _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;
}
