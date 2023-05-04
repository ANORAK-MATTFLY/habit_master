import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages

class RoutineEntity extends Equatable {
  final String? authorID;
  final String? authorName;
  final String? authorProfilePicture;
  final String? description;
  final String? subTitle;
  final int? subscribers;
  final int? successRate;
  final String? type;
  final int? progress;

  const RoutineEntity({
    this.authorID,
    this.authorName,
    this.authorProfilePicture,
    this.description,
    this.subTitle,
    this.subscribers,
    this.successRate,
    this.type,
    this.progress,
  });

  @override
  List<Object> get props {
    return [
      authorID!,
      authorName!,
      authorProfilePicture!,
      description!,
      subTitle!,
      subscribers!,
      successRate!,
      type!,
      progress!,
    ];
  }
}
