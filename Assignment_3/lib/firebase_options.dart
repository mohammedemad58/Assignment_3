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
    apiKey: 'AIzaSyDToizClIPzF-w21xZTsflvXVHrY_kWzAQ',
    appId: '1:263843116663:android:b5a0ef3f7820d5f41d7872',
    messagingSenderId: '263843116663',
    projectId: 'assignment-3-1385c',
    databaseURL: 'https://assignment-3-1385c-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-3-1385c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAPT6Z5NNHJSK3g8lxdHck_SBTs1xAG_s',
    appId: '1:263843116663:ios:a59eaf7ccc657e341d7872',
    messagingSenderId: '263843116663',
    projectId: 'assignment-3-1385c',
    databaseURL: 'https://assignment-3-1385c-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-3-1385c.appspot.com',
    iosClientId: '263843116663-60en635i37t9mur3mn665eumd4re8avp.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment3',
  );
}
