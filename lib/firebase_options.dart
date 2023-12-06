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
    apiKey: 'AIzaSyDvAPPhlFhNljbf66yI6NSOEz6LJee-2NU',
    appId: '1:1068403499111:web:12badcfa04ca5d71b074c2',
    messagingSenderId: '1068403499111',
    projectId: 'ecommerce-981b1',
    authDomain: 'ecommerce-981b1.firebaseapp.com',
    storageBucket: 'ecommerce-981b1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAHojDYIM44hHJ2CERZljVOQuw35mbcgg',
    appId: '1:1068403499111:android:e35b962e78139abcb074c2',
    messagingSenderId: '1068403499111',
    projectId: 'ecommerce-981b1',
    storageBucket: 'ecommerce-981b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvvgop3d6dFnZs-0r-cWnmPb1vdDRRDKg',
    appId: '1:1068403499111:ios:6fa6f4bf1a940966b074c2',
    messagingSenderId: '1068403499111',
    projectId: 'ecommerce-981b1',
    storageBucket: 'ecommerce-981b1.appspot.com',
    iosBundleId: 'com.example.adminapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvvgop3d6dFnZs-0r-cWnmPb1vdDRRDKg',
    appId: '1:1068403499111:ios:cfcb1b8afa7b340cb074c2',
    messagingSenderId: '1068403499111',
    projectId: 'ecommerce-981b1',
    storageBucket: 'ecommerce-981b1.appspot.com',
    iosBundleId: 'com.example.adminapp.RunnerTests',
  );
}
