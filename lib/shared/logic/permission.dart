import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/core/db/db_constants.dart';
import 'package:habit_master/core/db/local_db.dart';
import 'package:habit_master/core/db/remote_db.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/api/identity_api.dart';
import 'package:habit_master/shared/models/permission_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PermissionLogic {
  setPermission() async {
    try {
      final permissionCollection = RemoteDatabase.permissionCollection;

      final internetChecker =
          await InternetConnectionChecker().connectionStatus;

      if (internetChecker == InternetConnectionStatus.connected) {
        final id = serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;

        final expirationDate =
            Timestamp.now().toDate().add(const Duration(seconds: 5));
        await permissionCollection.doc(id).set({
          "id": "1234",
          "is_free_plan": 1,
          "expiration_date": expirationDate.toString()
        });

        await createPermission();
      }
    } catch (error) {
      rethrow;
    }
  }

  invalidatePermission() async {
    try {
      final permissionCollection = RemoteDatabase.permissionCollection;

      final internetChecker =
          await InternetConnectionChecker().connectionStatus;

      if (internetChecker == InternetConnectionStatus.connected) {
        final id = serviceLocator<IdentityApi>().getAuthenticatedUser()!.uid;
        final permission = await permissionCollection.doc(id).get();
        final serializedPermission = Permission.fromJson(permission);
        if (Timestamp.now()
            .toDate()
            .isAfter(DateTime.parse(serializedPermission.expirationDate!))) {
          if (serializedPermission.isFreePlan == 1) {
            final database = await LocalDatabase.instance.database;
            await database.rawUpdate(
                "UPDATE permission SET is_free_plan = ${0} WHERE id = '1234'");
          }
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Permission> getPermission() async {
    final database = await LocalDatabase.instance.database;
    final permission =
        await database.rawQuery("SELECT * FROM permission WHERE id = '1234'");
    final permissionData = Permission.fromDB(permission[0]);
    return permissionData;
  }

  createPermission() async {
    try {
      final expirationDate =
          Timestamp.now().toDate().add(const Duration(minutes: 1));
      final permission = Permission(
        id: "1234",
        isFreePlan: 1,
        expirationDate: expirationDate.toString(),
      );

      final createPermissionQuery =
          LocalDatabaseConstantProvider.createPermission(permission);
      final database = await LocalDatabase.instance.database;
      await database.rawInsert(createPermissionQuery);
    } catch (error) {
      rethrow;
    }
  }
}
