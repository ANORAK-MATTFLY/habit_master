import 'package:flutter/foundation.dart';

import '../../../models/habit_option.dart';
import '../interfaces/option_interface.dart';

@immutable
class SelectOptionAction implements Option {
  final OptionInterface optionData;

  const SelectOptionAction({required this.optionData}) : super();
}
