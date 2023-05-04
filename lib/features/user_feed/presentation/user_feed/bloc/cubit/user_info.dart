import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/auth/infrastructure/model/user_aggregate.dart';

class UserAggregateCubit extends Cubit<UserAggregate> {
  UserAggregateCubit()
      : super(UserAggregate(
            atUserName: "",
            displayName: "",
            email: "",
            followers: [],
            following: [],
            jobTitle: "",
            lastSeen: Timestamp.now(),
            photoUrl: "",
            userDeviceToken: "",
            userID: ""));

  void updateState(newState) => emit(newState);
}
