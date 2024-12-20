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
    apiKey: 'AIzaSyBlwBjhvfkZ5Bpa8_OvHG6n6gD905Mucy8',
    appId: '1:214740739292:web:e398b5e17a9860be794019',
    messagingSenderId: '214740739292',
    projectId: 'ecommerceapp-a8449',
    authDomain: 'ecommerceapp-a8449.firebaseapp.com',
    storageBucket: 'ecommerceapp-a8449.appspot.com',
    measurementId: 'G-D03E1S7FF3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuQMItLS_y0MsVK1tSgKyEKi_GC6CWCLM',
    appId: '1:214740739292:android:351f62339fc1ad31794019',
    messagingSenderId: '214740739292',
    projectId: 'ecommerceapp-a8449',
    storageBucket: 'ecommerceapp-a8449.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2TBElQUF0UF_t6tpyvUqSSmJ0jVehn9Q',
    appId: '1:214740739292:ios:ef86dbecedcfdf96794019',
    messagingSenderId: '214740739292',
    projectId: 'ecommerceapp-a8449',
    storageBucket: 'ecommerceapp-a8449.appspot.com',
    androidClientId: '214740739292-uof8agcbnarhiaee473ule9ojp7vjjic.apps.googleusercontent.com',
    iosClientId: '214740739292-28k88uerv98ocfekvso6fprcjjl2a156.apps.googleusercontent.com',
    iosBundleId: 'com.example.appMyPham',
  );

}