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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDhsGWqAHjwn4YvIzDfT-LXRh4TSBJ2N58',
    appId: '1:1005369372742:web:8158659cf3879e40431a47',
    messagingSenderId: '1005369372742',
    projectId: 'mrcwaterlevel',
    authDomain: 'mrcwaterlevel.firebaseapp.com',
    databaseURL: 'https://mrcwaterlevel-default-rtdb.firebaseio.com',
    storageBucket: 'mrcwaterlevel.appspot.com',
    measurementId: 'G-3770GSK1N4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSPgW5RMDuWAplYLjs9JllGCKlr6laq_s',
    appId: '1:1005369372742:android:72a154d449f716a2431a47',
    messagingSenderId: '1005369372742',
    projectId: 'mrcwaterlevel',
    databaseURL: 'https://mrcwaterlevel-default-rtdb.firebaseio.com',
    storageBucket: 'mrcwaterlevel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4NveYj9FvKu4TGrXc8brIKR_p4SWvi2c',
    appId: '1:1005369372742:ios:a906cdf63966296c431a47',
    messagingSenderId: '1005369372742',
    projectId: 'mrcwaterlevel',
    databaseURL: 'https://mrcwaterlevel-default-rtdb.firebaseio.com',
    storageBucket: 'mrcwaterlevel.appspot.com',
    iosClientId: '1005369372742-g762v400cbrqs5jjegt3apg9rjj192r2.apps.googleusercontent.com',
    iosBundleId: 'com.example.mrcMobileApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4NveYj9FvKu4TGrXc8brIKR_p4SWvi2c',
    appId: '1:1005369372742:ios:56f9addd31530a31431a47',
    messagingSenderId: '1005369372742',
    projectId: 'mrcwaterlevel',
    databaseURL: 'https://mrcwaterlevel-default-rtdb.firebaseio.com',
    storageBucket: 'mrcwaterlevel.appspot.com',
    iosClientId: '1005369372742-1ne96gp6d3imdr8ptvve1d84lhobigsk.apps.googleusercontent.com',
    iosBundleId: 'com.example.mrcMobileApp.RunnerTests',
  );
}
