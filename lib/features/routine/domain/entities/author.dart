import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final String? id;
  final String? authorName;
  final String? authorProfilePicture;
  final String? type;
  final String? subscribedTo;
  const AuthorEntity({
    required this.id,
    required this.authorName,
    required this.authorProfilePicture,
    required this.type,
    required this.subscribedTo,
  });

  @override
  List<Object> get props {
    return [
      id!,
      authorName!,
      authorProfilePicture!,
      type!,
      subscribedTo!,
    ];
  }
}
