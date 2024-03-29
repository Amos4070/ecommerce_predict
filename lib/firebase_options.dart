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
    apiKey: 'AIzaSyCUT04FNcY8QLhY_4pZnCmYfAHz_caK278',
    appId: '1:241664108508:web:07b70f1f5f42cb8e649119',
    messagingSenderId: '241664108508',
    projectId: 'predict-2a3d1',
    authDomain: 'predict-2a3d1.firebaseapp.com',
    databaseURL: 'https://predict-2a3d1-default-rtdb.firebaseio.com',
    storageBucket: 'predict-2a3d1.appspot.com',
    measurementId: 'G-88ZH81MKW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCL-mpqkJ9SMasY_l4WSHzp9dzDVc3H5Lk',
    appId: '1:241664108508:android:f76f4d08111f39fa649119',
    messagingSenderId: '241664108508',
    projectId: 'predict-2a3d1',
    databaseURL: 'https://predict-2a3d1-default-rtdb.firebaseio.com',
    storageBucket: 'predict-2a3d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJ7Gf_wNZFjI93Snl_1M8WhFka91t840M',
    appId: '1:241664108508:ios:17d5820115ae95c5649119',
    messagingSenderId: '241664108508',
    projectId: 'predict-2a3d1',
    databaseURL: 'https://predict-2a3d1-default-rtdb.firebaseio.com',
    storageBucket: 'predict-2a3d1.appspot.com',
    iosBundleId: 'com.example.ecommercePredict',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJ7Gf_wNZFjI93Snl_1M8WhFka91t840M',
    appId: '1:241664108508:ios:3f44ed4bfc4fdc66649119',
    messagingSenderId: '241664108508',
    projectId: 'predict-2a3d1',
    databaseURL: 'https://predict-2a3d1-default-rtdb.firebaseio.com',
    storageBucket: 'predict-2a3d1.appspot.com',
    iosBundleId: 'com.example.ecommercePredict.RunnerTests',
  );
}
