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
///Todo Navigator issue
///Todo Logout button
///Todo Add comments wherever necessary

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
