import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/exception.dart';
import 'package:sqflite/sqflite.dart';

import 'interface/error_model.dart';

class ExceptionHandlers implements ExceptionHandlersInterface {
  @override
  Left<Failure, bool> handleLocalDatabaseError(
      DatabaseException error, String source) {
    if (error.isDatabaseClosedError()) {
      return Left(Failure(
        errorMessage: "The database is closed",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isDuplicateColumnError()) {
      return Left(Failure(
        errorMessage: "The database is closed",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isNoSuchTableError()) {
      return Left(Failure(
        errorMessage: "No such table",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isNotNullConstraintError()) {
      return Left(Failure(
        errorMessage: "Null constraint",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isOpenFailedError()) {
      return Left(Failure(
        errorMessage: "Open failed",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isSyntaxError()) {
      return Left(Failure(
        errorMessage: "Syntax error while creating the author",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isUniqueConstraintError()) {
      return Left(Failure(
        errorMessage: "Field should be unique",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }
    if (error.isReadOnlyError()) {
      return Left(Failure(
        errorMessage: "Database are table is a read-only",
        errorSource: source,
        errorType: "DatabaseException",
      ));
    }

    return Left(Failure(
      errorMessage: "Something went wrong in the local database",
      errorSource: source,
      errorType: "DatabaseException",
    ));
  }
}
