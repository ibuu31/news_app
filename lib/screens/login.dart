import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/constant.dart';
import '../components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email.text = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: password,
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password.text = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                  User? user = userCredential.user;
                  print('Sign-in: ${user!.uid}');
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString("email", email.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ));
                } catch (e) {
                  print('catch is running');
                  print(e.toString());
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ));
              },
              style: const ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll(Colors.lightBlueAccent)),
              child: const Text('Not having account, Signup?'),
            )
          ],
        ),
      ),
    );
  }
}
