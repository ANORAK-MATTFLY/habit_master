import 'package:flutter/foundation.dart';

import '../../../../../../infrastructure/models/author_model.dart';
import '../interface/author_interface.dart';

@immutable
class CreateAuthorAction implements AuthorBlocInterface {
  final Author author;

  const CreateAuthorAction({required this.author}) : super();
}
