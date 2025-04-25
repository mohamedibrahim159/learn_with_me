import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("General Exception: $e");
      return null;
    }
  }
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("General Exception: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null || googleAuth.accessToken == null) {
        return null;
      }

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in the user with the credential
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("General Exception: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      if (result.status == LoginStatus.success) {
        // Sign in the user with the credential
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        return userCredential;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("General Exception: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}