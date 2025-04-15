import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase(FirebaseOptions options) async {
    await Firebase.initializeApp(options: options);
  }
}