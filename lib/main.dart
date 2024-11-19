import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/log/LoginPage.dart';
import 'package:login/view/Home.dart';

import 'service/LoginController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder<bool>(
              future: authController.checkLoginState(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data == true) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              },
            ),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
