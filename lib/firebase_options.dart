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
    apiKey: 'AIzaSyDhe2gvPp8kebEjCt0v5gfMuLtw5kFq_yY',
    appId: '1:734708283541:web:eb65d6b18bbd74874e039c',
    messagingSenderId: '734708283541',
    projectId: 'namoz-time',
    authDomain: 'namoz-time.firebaseapp.com',
    storageBucket: 'namoz-time.firebasestorage.app',
    measurementId: 'G-NTVWXVSBB0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLw76LRALCLl-o0_p1ddkIJOEQ-A8o22s',
    appId: '1:734708283541:android:7d170e30cc01249a4e039c',
    messagingSenderId: '734708283541',
    projectId: 'namoz-time',
    storageBucket: 'namoz-time.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB88CBR4mXcTT4Zb_J_q9U91lRfW_TXxg0',
    appId: '1:734708283541:ios:7859db82a82b74544e039c',
    messagingSenderId: '734708283541',
    projectId: 'namoz-time',
    storageBucket: 'namoz-time.firebasestorage.app',
    iosBundleId: 'com.example.namozVaqtlari',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB88CBR4mXcTT4Zb_J_q9U91lRfW_TXxg0',
    appId: '1:734708283541:ios:7859db82a82b74544e039c',
    messagingSenderId: '734708283541',
    projectId: 'namoz-time',
    storageBucket: 'namoz-time.firebasestorage.app',
    iosBundleId: 'com.example.namozVaqtlari',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhe2gvPp8kebEjCt0v5gfMuLtw5kFq_yY',
    appId: '1:734708283541:web:83eb701eac41ac0c4e039c',
    messagingSenderId: '734708283541',
    projectId: 'namoz-time',
    authDomain: 'namoz-time.firebaseapp.com',
    storageBucket: 'namoz-time.firebasestorage.app',
    measurementId: 'G-TLHWXN0ZGH',
  );
}
