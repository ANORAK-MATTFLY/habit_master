import 'package:flutter/foundation.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';

@immutable
class AuthorState {
  final Routine authorState;

  const AuthorState({required this.authorState});
}
