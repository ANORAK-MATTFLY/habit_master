import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  const User({
    @required  this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.photoPath,
  });

  final String? email;
  final String? firstName;
  final String? lastName;
  final String? photoPath;

  @override
  List get props => <dynamic>[email, firstName, lastName, photoPath];
}
