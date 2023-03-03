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
        return macos;
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
    apiKey: 'AIzaSyBSgkAfsdshRfBpxELgj01bMhMxmXiRAxo',
    appId: '1:834039968228:web:509915849ab521819597f1',
    messagingSenderId: '834039968228',
    projectId: 'blue-hive-ecommerce-b773d',
    authDomain: 'blue-hive-ecommerce-b773d.firebaseapp.com',
    storageBucket: 'blue-hive-ecommerce-b773d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2Zv6rJWT5fHazv1PzB9FZP_Jf55S6vQg',
    appId: '1:834039968228:android:b14bb78c3ba09bbd9597f1',
    messagingSenderId: '834039968228',
    projectId: 'blue-hive-ecommerce-b773d',
    storageBucket: 'blue-hive-ecommerce-b773d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlcPvefZRQwgrN78V9ctdyEBR_9q938Vw',
    appId: '1:834039968228:ios:f058d90fedfb9d1c9597f1',
    messagingSenderId: '834039968228',
    projectId: 'blue-hive-ecommerce-b773d',
    storageBucket: 'blue-hive-ecommerce-b773d.appspot.com',
    iosClientId: '834039968228-7f0phrkmi4jmd9du9rekjhfpph21tput.apps.googleusercontent.com',
    iosBundleId: 'com.example.blueHiveEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlcPvefZRQwgrN78V9ctdyEBR_9q938Vw',
    appId: '1:834039968228:ios:f058d90fedfb9d1c9597f1',
    messagingSenderId: '834039968228',
    projectId: 'blue-hive-ecommerce-b773d',
    storageBucket: 'blue-hive-ecommerce-b773d.appspot.com',
    iosClientId: '834039968228-7f0phrkmi4jmd9du9rekjhfpph21tput.apps.googleusercontent.com',
    iosBundleId: 'com.example.blueHiveEcommerce',
  );
}
