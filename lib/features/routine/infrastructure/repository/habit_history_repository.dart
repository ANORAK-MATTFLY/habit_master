import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habit_master/core/errors/interface/error_model.dart';
import 'package:habit_master/features/routine/domain/interfaces/habit_history_interface.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/mutation/habit_history.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/queries/habit_history_queries.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_history.dart';

class HabitHistoryRepository implements HabitHistoryInterface {
  final habitHistoryMutations = HabitHistoryMutations();
  final habitHistoryQueries = HabitHistoryQueries();

  @override
  Future<Either<ErrorInfo, bool>> deleteHabitHistoryRecord(
      String habitHistoryID) {
    return habitHistoryMutations.deleteHabitHistoryRecord(habitHistoryID);
  }

  @override
  Future<List<HabitHistory>> getHabitHistoryRecord(
      String habitHistoryID) async {
    final List<HabitHistory> habitRecords = [];
    final rawHabitHistoryData =
        await habitHistoryQueries.getHabitHistoryRecord(habitHistoryID);
    for (var index = 0; index < rawHabitHistoryData.length; index++) {
      final habitHistory = HabitHistory.fromJson(rawHabitHistoryData[index]);
      habitRecords.add(habitHistory);
    }
    return habitRecords;
  }

  @override
  Future<Either<ErrorInfo, bool>> createHabitHistoryRecord(
      HabitHistory habitHistory) {
    return habitHistoryMutations.createHabitHistoryRecord(habitHistory);
  }

  @override
  Future<HabitHistory> getTodaysHabitHistoryRecord(
      String habitHistoryID) async {
    final doneOn = Timestamp.now().toDate().toString().split(" ")[0];
    final rawHabitHistoryData = await HabitHistoryQueries()
        .getTodaysHabitHistoryRecord(habitHistoryID, doneOn);
    if (rawHabitHistoryData.isEmpty) {
      return HabitHistory(doneOn: null, habitID: null, id: null);
    }
    HabitHistory habitHistory = HabitHistory.fromJson(rawHabitHistoryData[0]);
    return habitHistory;
  }
}
