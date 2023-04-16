import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'user_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("No user found with this email!"),
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: "Dismiss",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    //Create the textfield controllers
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      //Body of the page
      body: Stack(
        children: [
          Container(
            height: 1200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login page background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Back button
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Column(
            children: [
              //Center the widget
              Align(
                child: Transform.translate(
                  offset: const Offset(0, 90),
                  child: Column(
                    children: [
                      //Backgroud widget
                      Container(
                        alignment: Alignment.center,
                        width: 320,
                        height: 550,
                        margin: const EdgeInsets.only(
                            top: 80, bottom: 10, right: 50, left: 50),
                        decoration: BoxDecoration(
                          color:
                              const Color.fromARGB(166, 255, 255, 255), //Color
                          borderRadius: BorderRadius.circular(
                              40), //Make the corners round
                        ),
                        child: Column(
                          children: [
                            //Login text
                            Align(
                              alignment: const Alignment(0, -0.6),
                              child: Container(
                                margin: const EdgeInsets.only(top: 120),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            //Text field for the username
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "Enter your username",
                                ),
                              ),
                            ),
                            //Text field for the password
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: "Enter your password",
                                ),
                              ),
                            ),
                            //Login button
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              //Navigate to the UserAccount page when the button clicked
                              onPressed: () async {
                                User? user = await loginUsingEmailPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context);
                                print(user);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => UserAccount()));
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const UserAccount(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text("Login"),
                            ),
                            //Space between the login button and the below text
                            const SizedBox(
                              height: 20,
                            ),
                            //Area to re-direct to the signup page
                            SizedBox(
                              height: 20,
                              child: GestureDetector(
                                //redirect to signup page if it's clicked
                                onTap: () {
                                  Navigator.pushNamed(context, '/Signup');
                                },
                                //Make the "Not a member?" text black
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Not a member?  ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      //Make the "Signup" text blue
                                      TextSpan(
                                        text: "Signup",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
