import 'package:flutter/foundation.dart';

import '../interfaces/competitors_event.dart';
import '../bloc_logic/logic.dart';

@immutable
class LoadCompetitorsAction implements CompetitorsEventType {
  final PersonUrl url;

  const LoadCompetitorsAction({required this.url}) : super();
}
