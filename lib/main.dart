import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/login_page.dart';
import 'package:movie_hut/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MovieHut());
}

class MovieHut extends StatefulWidget {
  const MovieHut({super.key});

  @override
  State<MovieHut> createState() => _MovieHutState();
}

class _MovieHutState extends State<MovieHut> {
  // //Initialize the firebase app
  // Future<FirebaseApp> _initiateFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

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
