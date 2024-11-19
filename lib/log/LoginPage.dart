import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';

import '../service/LoginController.dart';
import 'Singin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // static Future<User?> loginUsingEmailPassword(
  //     {required String emailAddress,
  //     required String password,
  //     required BuildContext Context}) async {
  //   print(emailAddress + password);
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try {
  //     final credential = await auth.signInWithEmailAndPassword(
  //         email: emailAddress, password: password);
  //     user = credential.user;
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user;
  // }
  final AuthController authController = AuthController();
  TextEditingController emailContorller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login ",
              style: TextStyle(
                  fontSize: 33, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter Your Contact",
              style: TextStyle(
                  //color: Colors.red.shade200,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailContorller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  prefixIcon: const Icon(IconlyBold.message, color: Colors.red),
                  hintText: "Emai@gmial.com"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  prefixIcon: const Icon(IconlyBold.lock, color: Colors.red),
                  suffixIcon:
                      const Icon(Icons.visibility_off, color: Colors.red),
                  hintText: "password"),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
              width: double.infinity,
              child: InkWell(
                onTap: () async {
                  String email = emailContorller.text.trim();
                  String password = passwordController.text.trim();

                  bool isSuccess =
                      await authController.loginUser(email, password, context);
                  if (isSuccess) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login failed')),
                    );
                  }
                },
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Singin()));
                },
                child: Text("Do'nt Have Any Account ?"))
          ],
        ),
      ),
    );
  }
}
