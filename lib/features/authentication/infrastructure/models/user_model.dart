import 'package:habit_master/features/authentication/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  const UserModel({
    @required String? email,
    @required String? firstName,
    @required String? lastName,
    @required String? photoPath,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
          photoPath: photoPath,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      photoPath: json['photoPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'photoPath': photoPath,
    };
  }
}
