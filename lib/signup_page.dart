import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Setting the background color of the page
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   //    automaticallyImplyLeading:
      //   //        false, //Remove the default buttons from the app bar
      //   //Changing the color of the icons
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0, //Remove the shadows to make it complete transparent
      // ),

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
                            //Signup text
                            Align(
                              alignment: const Alignment(0, -0.6),
                              child: Container(
                                margin: const EdgeInsets.only(top: 80),
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            //Text field for the name
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: TextField(
                                  decoration: InputDecoration(
                                hintText: "Enter your name",
                              )),
                            ),
                            //Text field for the username
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: TextField(
                                  decoration: InputDecoration(
                                hintText: "Enter your username",
                              )),
                            ),
                            //Text field for the password
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: TextField(
                                  decoration: InputDecoration(
                                hintText: "Enter your password",
                              )),
                            ),
                            //Signup button
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text("Signup"),
                            ),
                            //Space between the login button and the below text
                            const SizedBox(
                              height: 20,
                            ),
                            //Area to re-direct to the login page
                            SizedBox(
                              height: 20,
                              child: GestureDetector(
                                //redirect to login page if it's clicked
                                onTap: () {
                                  Navigator.pushNamed(context, '/Login');
                                },
                                //Make the "Already a member?" text black
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Already a member?  ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      //Make the "Login" text blue
                                      TextSpan(
                                        text: "Login",
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
