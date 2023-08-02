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
    apiKey: 'AIzaSyCIqSfNU63LhDI4EFj-O9f5Lio0mV3ElO8',
    appId: '1:187319673454:web:4678af56aa5fe1f3b07c7f',
    messagingSenderId: '187319673454',
    projectId: 'solardino-aea02',
    authDomain: 'solardino-aea02.firebaseapp.com',
    storageBucket: 'solardino-aea02.appspot.com',
    measurementId: 'G-GFZQBQF0QB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt96GLeBRhkvoNtmtWaTM8xtFNQUQqXQM',
    appId: '1:187319673454:android:1d37a2620a27441fb07c7f',
    messagingSenderId: '187319673454',
    projectId: 'solardino-aea02',
    storageBucket: 'solardino-aea02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDj2jK2RMojbC2i2b0MmawF718bQurQdkY',
    appId: '1:187319673454:ios:035cd56615162a96b07c7f',
    messagingSenderId: '187319673454',
    projectId: 'solardino-aea02',
    storageBucket: 'solardino-aea02.appspot.com',
    iosClientId: '187319673454-s70nqiam1qask998su9ioq13fb5knijd.apps.googleusercontent.com',
    iosBundleId: 'com.example.solardino',
  );
}
