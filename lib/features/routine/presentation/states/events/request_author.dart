import 'package:flutter/foundation.dart';
import 'package:habit_master/features/habits/infrastructure/models/author_model.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/author.dart';

@immutable
class RequestAuthor implements AuthorBlocInterface {
  final Author author;

  const RequestAuthor({required this.author}) : super();
}
