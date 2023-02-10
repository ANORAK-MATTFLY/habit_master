import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages

class RoutineEntity extends Equatable {
  final String? authorID;
  final String? authorName;
  final String? authorProfilePicture;
  final String? description;
  final String? subTitle;
  final int? isPremium;
  final int? subscribers;
  final int? successRate;

  const RoutineEntity({
    this.authorID,
    this.authorName,
    this.authorProfilePicture,
    this.description,
    this.isPremium,
    this.subTitle,
    this.subscribers,
    this.successRate,
  });

  @override
  List<Object> get props {
    return [
      authorID!,
      authorName!,
      authorProfilePicture!,
      description!,
      isPremium!,
      subTitle!,
      subscribers!,
      successRate!,
    ];
  }
}
