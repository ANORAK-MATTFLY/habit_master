import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/models/habit_option.dart';

@immutable
class OptionState {
  final OptionInterface option;

  const OptionState({required this.option});
}
