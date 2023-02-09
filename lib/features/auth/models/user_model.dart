class UserAggregate {
  String? userName;
  String? email;
  String? profilePicture;

  UserAggregate({
    this.userName,
    this.email,
    this.profilePicture,
  });

  UserAggregate.fromJson(Map<String, dynamic> json)
      : email = json["email"] as String,
        profilePicture = json["picture"] as String,
        userName = json["name"] as String;
}
