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
    apiKey: 'AIzaSyBag_aD7dc_QCMcGD-4lSlh6kCuKSobAa0',
    appId: '1:89826584000:web:c1075d13cf1dab11b7d425',
    messagingSenderId: '89826584000',
    projectId: 'banasorapp-23dea',
    authDomain: 'banasorapp-23dea.firebaseapp.com',
    storageBucket: 'banasorapp-23dea.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCytBGtWRe5jKlloYXanZzzrJEeFM3DGqs',
    appId: '1:89826584000:android:1738c2885b7056afb7d425',
    messagingSenderId: '89826584000',
    projectId: 'banasorapp-23dea',
    storageBucket: 'banasorapp-23dea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACAzYB-bg37eXx9LvX-Q8pzPY2nhm9CP0',
    appId: '1:89826584000:ios:184b541b17fe4d80b7d425',
    messagingSenderId: '89826584000',
    projectId: 'banasorapp-23dea',
    storageBucket: 'banasorapp-23dea.appspot.com',
    androidClientId: '89826584000-7kddimgicrij0cqpkbe5p93n9kj6c68p.apps.googleusercontent.com',
    iosClientId: '89826584000-mo1bp78tjlsn1n80peooohe06mo9fjm0.apps.googleusercontent.com',
    iosBundleId: 'com.example.banaSorApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACAzYB-bg37eXx9LvX-Q8pzPY2nhm9CP0',
    appId: '1:89826584000:ios:184b541b17fe4d80b7d425',
    messagingSenderId: '89826584000',
    projectId: 'banasorapp-23dea',
    storageBucket: 'banasorapp-23dea.appspot.com',
    androidClientId: '89826584000-7kddimgicrij0cqpkbe5p93n9kj6c68p.apps.googleusercontent.com',
    iosClientId: '89826584000-mo1bp78tjlsn1n80peooohe06mo9fjm0.apps.googleusercontent.com',
    iosBundleId: 'com.example.banaSorApp',
  );
}
