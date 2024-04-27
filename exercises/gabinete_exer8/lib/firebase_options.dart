// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAbDl3FjXZCx8xPOe9Dh7sC8ZiXlP4rTLA',
    appId: '1:428200017826:web:3d72d077b4850df4893cfb',
    messagingSenderId: '428200017826',
    projectId: 'cmsc23-ksgabinete',
    authDomain: 'cmsc23-ksgabinete.firebaseapp.com',
    storageBucket: 'cmsc23-ksgabinete.appspot.com',
    measurementId: 'G-FMZKBEBKVC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJtnCJqJwqalAQ6FDCe_O2DCTIEIn09oU',
    appId: '1:428200017826:android:ead446a2f1077093893cfb',
    messagingSenderId: '428200017826',
    projectId: 'cmsc23-ksgabinete',
    storageBucket: 'cmsc23-ksgabinete.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdtm_OXg_YdvN3NEWXs4Zo3n9U7fdnBvg',
    appId: '1:428200017826:ios:b2cedb1244bbb9d9893cfb',
    messagingSenderId: '428200017826',
    projectId: 'cmsc23-ksgabinete',
    storageBucket: 'cmsc23-ksgabinete.appspot.com',
    iosBundleId: 'com.example.gabineteExer8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdtm_OXg_YdvN3NEWXs4Zo3n9U7fdnBvg',
    appId: '1:428200017826:ios:b2cedb1244bbb9d9893cfb',
    messagingSenderId: '428200017826',
    projectId: 'cmsc23-ksgabinete',
    storageBucket: 'cmsc23-ksgabinete.appspot.com',
    iosBundleId: 'com.example.gabineteExer8',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbDl3FjXZCx8xPOe9Dh7sC8ZiXlP4rTLA',
    appId: '1:428200017826:web:7503c54d9d21f077893cfb',
    messagingSenderId: '428200017826',
    projectId: 'cmsc23-ksgabinete',
    authDomain: 'cmsc23-ksgabinete.firebaseapp.com',
    storageBucket: 'cmsc23-ksgabinete.appspot.com',
    measurementId: 'G-DM6D77Q3DL',
  );

}