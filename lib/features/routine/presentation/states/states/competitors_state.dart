import 'package:flutter/foundation.dart';

@immutable
class FetchResult {
  final Map<String, dynamic> competitors;
  final bool isRetrievedFromCache;

  const FetchResult(
      {required this.competitors, required this.isRetrievedFromCache});

  @override
  String toString() =>
      "isRetrievedFromCache: $isRetrievedFromCache, persons: $competitors";
}
