import 'package:carriage_cuisine/views/home_page.dart';
import 'package:carriage_cuisine/views/login_page.dart';
import 'package:carriage_cuisine/views/poster_page.dart';
import 'package:carriage_cuisine/views/signup_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home':(context)=>HomePage(),
        '/poster':(context) => PosterPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
