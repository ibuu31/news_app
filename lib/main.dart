import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(const MaterialApp(
      //if user is logged in then moved to home screen otherwise login screen
      home: MyApp()
      //email != null ? const HomeScreen() : const LoginScreen(),
      ));
}

///Todo remove MyApp
///Todo Google and Facebook
///Todo Navigator issue
///Todo UI of Sign In and Up
///Todo Logout button
///Todo Header on home page should be News App, if any source selected then it should be the source name
///Todo Email and Password variable in registration page
///Todo Add comments wherever necessary
///Todo
///Todo
///Todo
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
