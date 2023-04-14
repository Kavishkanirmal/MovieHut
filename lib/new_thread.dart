import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/navigation_drawer.dart';

class NewThread extends StatelessWidget {
  const NewThread({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, //To make the body visible through the appbar
      drawer: const MenuDrawer(), //Calling the drawer widget

      appBar: AppBar(
        //Changing the color of the icons
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent, //Make the background transparent
        systemOverlayStyle: SystemUiOverlayStyle
            .dark, //To make the status and navigation bars dark
        elevation: 0, //Remove the shadows to make it complete transparent
        //Back button
        actions: [
          SizedBox(
            width: 400,
            height: 10,
            child: Align(
              alignment: const Alignment(-0.81, 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(); //Go back
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/Home page background.PNG',
            //Make the image fill the page
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            //Center the widget
            child: Container(
              margin: const EdgeInsets.only(top: 35),
              height: 750,
              width: 340,
              decoration: const BoxDecoration(
                color: Color.fromARGB(166, 255, 255, 255),
                borderRadius: BorderRadius.all(
                  Radius.circular(20), //Make the corners curved
                ),
              ),
              child: Column(
                children: [
                  //Topic section
                  Row(
                    children: [
                      //Topic text
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          "Topic",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      //Text input section
                      Container(
                        margin: const EdgeInsets.only(left: 30), //Add margin
                        alignment:
                            const Alignment(0, -0.5), //Position the widget
                        width: 200,
                        height: 100,
                        child: TextFormField(),
                      ),
                    ],
                  ),
                  //Message text
                  const Text(
                    "Message",
                    style: TextStyle(fontSize: 20),
                  ),
                  //Message container
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 300,
                    height: 520,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(96, 185, 149, 149),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //Add the text input field
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type your message here..", //Hint text
                        contentPadding: EdgeInsets.all(
                            10), //To make a space between the border and the text
                      ),
                      maxLines: null, // To enable multiple line messages
                    ),
                  ),
                  //Submit button
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      //Customize the button
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            const Color.fromARGB(221, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Center(
                        //Make the text center of the widget
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, //Font weight
                            fontSize: 16, //font size
                          ),
                        ), //Text inside the widget
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
