class User {
  String? userName;
  String? email;
  String? profilePicture;

  User({
    this.userName,
    this.email,
    this.profilePicture,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"] as String,
        profilePicture = json["picture"] as String,
        userName = json["name"] as String;
}
