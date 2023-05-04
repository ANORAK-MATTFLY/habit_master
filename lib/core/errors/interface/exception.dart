import 'package:fpdart/fpdart.dart';
import 'package:sqflite/sqflite.dart';

import 'error_model.dart';

abstract class ExceptionHandlersInterface {
  Left<Failure, bool> handleLocalDatabaseError(
      DatabaseException error, String source);
}
