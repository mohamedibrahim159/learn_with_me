import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '', // Replace with your actual API key
    appId: '', // Replace with your actual app ID
    messagingSenderId: '', // Replace with your actual messaging sender ID
    projectId: '', // Replace with your actual project ID
    storageBucket: '', // Replace with your actual storage bucket
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '', // Replace with your actual API key
    appId: '', // Replace with your actual app ID
    messagingSenderId: '', // Replace with your actual messaging sender ID
    projectId: '', // Replace with your actual project ID
    storageBucket: '', // Replace with your actual storage bucket
    iosBundleId: '', // Replace with your actual iOS bundle ID
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '', // Replace with your actual API key
    appId: '', // Replace with your actual app ID
    messagingSenderId: '', // Replace with your actual messaging sender ID
    projectId: '', // Replace with your actual project ID
    storageBucket: '', // Replace with your actual storage bucket
  );
}

    );
  }
}