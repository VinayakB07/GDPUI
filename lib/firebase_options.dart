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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCZs4k2MZfBpvjv_5vw7dl4S-QINY8iNWw',
    appId: '1:1072210490895:web:ee36ce35b73cd799e1557a',
    messagingSenderId: '1072210490895',
    projectId: 'foodapp-60f48',
    authDomain: 'foodapp-60f48.firebaseapp.com',
    storageBucket: 'foodapp-60f48.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMB5zckQGwMlJnTwedQVb3lDZvlnEBr0k',
    appId: '1:1072210490895:android:fca5fff6aa845363e1557a',
    messagingSenderId: '1072210490895',
    projectId: 'foodapp-60f48',
    storageBucket: 'foodapp-60f48.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCp1DWJ2LNoU9a7uRaZTYYUjcpRPz5c1u8',
    appId: '1:1072210490895:ios:9694cd7cb7b23ae0e1557a',
    messagingSenderId: '1072210490895',
    projectId: 'foodapp-60f48',
    storageBucket: 'foodapp-60f48.appspot.com',
    iosBundleId: 'com.example.foodApp',
  );
}