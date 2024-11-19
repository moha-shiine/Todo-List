import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Login using email and password
  static Future<User?> loginUsingEmailPassword({
    required String emailAddress,
    required String password,
  }) async {
    User? user;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      user = credential.user;

      // Save user ID in SharedPreferences
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.uid);
        print('Login successful. User ID saved: ${user.uid}');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return user;
  }

  /// Check if user is logged in
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userId');
  }

  /// Logout and clear shared preferences
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    print('User logged out and shared preferences cleared.');
  }
}
