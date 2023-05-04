// ignore_for_file: overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_master/features/user_feed/domain/entities/post_entity.dart';

// ignore: must_be_immutable
class Post extends PostEntity {
  @override
  String? id;
  @override
  String? ownerID;
  @override
  String? ownerTokenID;
  @override
  String? postParentID;
  @override
  String? ownerName;
  @override
  String? type;
  @override
  String? ownerProfilePicture;
  @override
  String? textContent;
  @override
  List? likes;
  @override
  int? comments;
  @override
  Timestamp? createdAt;

  Post({
    this.id,
    this.ownerID,
    this.ownerTokenID,
    this.postParentID,
    this.ownerName,
    this.type,
    this.ownerProfilePicture,
    this.textContent,
    this.likes,
    this.comments,
    this.createdAt,
  });

  factory Post.fromDocument(dynamic doc) {
    return Post(
      id: doc["id"],
      ownerID: doc["owner_id"],
      ownerTokenID: doc["owner_token_id"],
      postParentID: doc["post_parent_id"],
      ownerName: doc["owner_name"],
      type: doc["type"],
      ownerProfilePicture: doc["owner_profile_picture"],
      textContent: doc["text_content"],
      likes: doc["likes"],
      comments: doc["comments"],
      createdAt: doc["created_at"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "owner_id": ownerID,
      "owner_token_id": ownerTokenID,
      "post_parent_id": postParentID,
      "owner_name": ownerName,
      "type": type,
      "owner_profile_picture": ownerProfilePicture,
      "likes": likes,
      "comments": comments,
      "created_at": createdAt,
      "text_content": textContent,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map["id"],
      ownerID: map['owner_id'],
      ownerTokenID: map['owner_token_id'],
      postParentID: map['post_parent_id'],
      ownerName: map['owner_name'],
      type: map['type'],
      ownerProfilePicture: map['owner_profile_picture'],
      likes: map['likes'],
      comments: map['comments'],
      createdAt: map['created_at'],
      textContent: map['text_content'],
    );
  }
}
