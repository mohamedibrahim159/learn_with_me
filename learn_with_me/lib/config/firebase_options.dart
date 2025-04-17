import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: null,
      appId: null,
      messagingSenderId: null,
      projectId: null,
      authDomain: null,
      databaseURL: null,
      storageBucket: null,
      iosBundleId: null,
      androidPackageName: null,
      iosAppId: null,
      androidAppId: null,
      iosClientId: null,
      androidClientId: null,
    );
  }
}