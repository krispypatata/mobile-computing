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
    apiKey: 'AIzaSyBvDGRX1zFNq1lPXMM7jpKZENx3MNAiFco',
    appId: '1:975888757669:web:4b54196cfbc83a9732ee4c',
    messagingSenderId: '975888757669',
    projectId: 'cmsc23-todo-app-ksgabinete',
    authDomain: 'cmsc23-todo-app-ksgabinete.firebaseapp.com',
    storageBucket: 'cmsc23-todo-app-ksgabinete.appspot.com',
    measurementId: 'G-J5GSZWVRFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ5zPw2LIzIHTjOT7GUOOZhz010j4AEUI',
    appId: '1:975888757669:android:d7ce8e223aee43e532ee4c',
    messagingSenderId: '975888757669',
    projectId: 'cmsc23-todo-app-ksgabinete',
    storageBucket: 'cmsc23-todo-app-ksgabinete.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANfoUbcxBRRJJz7whLzb_vC6P_rOKIZHA',
    appId: '1:975888757669:ios:825360774d36294232ee4c',
    messagingSenderId: '975888757669',
    projectId: 'cmsc23-todo-app-ksgabinete',
    storageBucket: 'cmsc23-todo-app-ksgabinete.appspot.com',
    iosBundleId: 'com.example.week7NetworkingDiscussion',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANfoUbcxBRRJJz7whLzb_vC6P_rOKIZHA',
    appId: '1:975888757669:ios:825360774d36294232ee4c',
    messagingSenderId: '975888757669',
    projectId: 'cmsc23-todo-app-ksgabinete',
    storageBucket: 'cmsc23-todo-app-ksgabinete.appspot.com',
    iosBundleId: 'com.example.week7NetworkingDiscussion',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBvDGRX1zFNq1lPXMM7jpKZENx3MNAiFco',
    appId: '1:975888757669:web:3d7b1e30126c0bb032ee4c',
    messagingSenderId: '975888757669',
    projectId: 'cmsc23-todo-app-ksgabinete',
    authDomain: 'cmsc23-todo-app-ksgabinete.firebaseapp.com',
    storageBucket: 'cmsc23-todo-app-ksgabinete.appspot.com',
    measurementId: 'G-11ZDVV3MCH',
  );
}