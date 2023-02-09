import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../infrastructure/data_sources/remote_data_source/user_mutations.dart';

class GoogleAuth extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  Future loginWithGoogle() async {
    final user = await googleSignIn.signIn();

    final googleAuth = await user!.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ) as GoogleAuthCredential;
    await FirebaseAuth.instance.signInWithCredential(credential);
    GoogleSignInAccount currentUser = googleSignIn.currentUser!;
    UserMutations().createNewUser(currentUser);
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }
}
