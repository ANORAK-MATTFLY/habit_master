import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAggregate {
  String? userID;
  String? displayName;
  String? photoUrl;
  String? userDeviceToken;

  UserAggregate({
    this.userID,
    this.displayName,
    this.photoUrl,
    this.userDeviceToken,
  });

  factory UserAggregate.fromGoogleAuth(GoogleSignInAccount user) {
    return UserAggregate(
      userID: user.id,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      userDeviceToken: "",
    );
  }

  factory UserAggregate.fromFacebookAuth(UserInfo user) {
    return UserAggregate(
      userID: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      userDeviceToken: "",
    );
  }
}
