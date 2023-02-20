import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/interface/error_model.dart';
import '../../infrastructure/models/author_model.dart';

abstract class AuthorInterface {
  Future<Either<ErrorInfo, bool>> createAuthor(Author author);
  Future<Either<ErrorInfo, bool>> subscribeToRoutine(
      String routineID, String currentUserID);
  Future<bool> checkIfAuthorExist(String authorID);
  Future getAuthorById(String authorID);
}
