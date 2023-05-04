import 'package:cloud_firestore/cloud_firestore.dart';

class UserAggregate {
  String? userID;
  String? displayName;
  String? email;
  String? photoUrl;
  String? jobTitle;
  String? atUserName;
  String? userDeviceToken;
  List? followers;
  List? following;
  Timestamp? lastSeen;

  UserAggregate({
    this.userID,
    this.displayName,
    this.atUserName,
    this.photoUrl,
    this.userDeviceToken,
    this.email,
    this.followers,
    this.following,
    this.lastSeen,
    this.jobTitle,
  });

  factory UserAggregate.fromDocument(dynamic doc) {
    return UserAggregate(
      userID: doc["id"],
      displayName: doc["display_name"],
      atUserName: doc["@name"],
      photoUrl: doc["photo_url"],
      userDeviceToken: doc["user_device_token"],
      email: doc["email"],
      followers: doc["followers"],
      following: doc["following"],
      lastSeen: doc["last_seen"],
      jobTitle: doc["job_title"],
    );
  }
}
