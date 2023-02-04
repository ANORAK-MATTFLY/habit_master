import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/author_model.dart';

@immutable
class AuthorState {
  final Author author;

  const AuthorState({required this.author});
}
