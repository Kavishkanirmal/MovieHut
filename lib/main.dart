import 'package:flutter/material.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/login_page.dart';
import 'package:movie_hut/signup_page.dart';

void main() {
  runApp(const MovieHut());
}

class MovieHut extends StatelessWidget {
  const MovieHut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ("Movie Hut"),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/Login': (context) => const LoginPage(),
        '/Signup': (context) => const SignupPage(),
      },
      home: const HomePage(),
    );
  }
}
