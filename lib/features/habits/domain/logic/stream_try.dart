import 'dart:async';

class TryStream {
  TryStream() {
    for (var i = 0; i < 10; i++) {
      streamController.sink.add(i);
    }
  }

  final streamController = StreamController<int>();
  Stream<int> get stream => streamController.stream;
}
