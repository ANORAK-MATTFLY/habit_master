// import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
// import 'package:meta/meta.dart';

class AuthorEntity {
  final String? id;
  final String? authorName;
  final String? authorProfilePicture;
  final int? isPredefined;
  final int? isPremium;

  AuthorEntity({
    required this.id,
    required this.authorName,
    required this.authorProfilePicture,
    required this.isPredefined,
    required this.isPremium,
  });

  List<Object> get props {
    return [
      id!,
      authorName!,
      authorProfilePicture!,
      isPredefined!,
      isPremium!,
    ];
  }
}
