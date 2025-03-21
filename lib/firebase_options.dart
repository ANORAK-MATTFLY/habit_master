// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPlojMDV8YTe2U9AsPKwjLwW87NnBhbi0',
    appId: '1:1060347675950:android:a8d6d36387bcc8ef0166bf',
    messagingSenderId: '1060347675950',
    projectId: 'habit-master-api',
    storageBucket: 'habit-master-api.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD02c-mB_GZX3MDkau8uq65zaTUH9hYkos',
    appId: '1:1060347675950:ios:f48d65a6f121dbc90166bf',
    messagingSenderId: '1060347675950',
    projectId: 'habit-master-api',
    storageBucket: 'habit-master-api.appspot.com',
    androidClientId: '1060347675950-356pb5sd4da24112ndn1do8k1neonvvc.apps.googleusercontent.com',
    iosClientId: '1060347675950-b74lglssr7cal407879ihaghol241sac.apps.googleusercontent.com',
    iosBundleId: 'com.softwareTools.habitMaster',
  );
}
