import 'package:flutter/material.dart';
import 'package:login/database/sharepeference.dart';

class AuthController {
  /// Login user and navigate accordingly
  Future<bool> loginUser(
      String email, String password, BuildContext context) async {
    final user = await AuthModel.loginUsingEmailPassword(
      emailAddress: email,
      password: password,
    );

    if (user != null) {
      print('User logged in: ${user.email}');
      return true;
    } else {
      return false;
    }
  }

  /// Check login state
  Future<bool> checkLoginState() async {
    return await AuthModel.isUserLoggedIn();
  }

  /// Logout user
  Future<void> logoutUser() async {
    await AuthModel.logout();
  }
}
