import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/navigation_drawer.dart';

class Thread extends StatefulWidget {
  const Thread({super.key});

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final List<String> _chats = []; //Declare a list to store the chats
  final TextEditingController _chatController =
      TextEditingController(); //Declare the text editing controller

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
        //Log out button
        actions: [
          SizedBox(
            width: 400,
            height: 10,
            child: Align(
              alignment: const Alignment(-0.81, 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back), //Back icon
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
          //Adding the background image
          Image.asset(
            'assets/Home page background.PNG',
            //Make the image fill the page
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          //Rest of the body
          Center(
            //Background widget
            child: Container(
              margin: const EdgeInsets.only(top: 55),
              //Define the size of the widget
              width: 370,
              height: 770,
              decoration: const BoxDecoration(
                color: Color.fromARGB(98, 254, 253, 253), //Color of the widget
                borderRadius: BorderRadius.all(
                  Radius.circular(20), //Make the corners round
                ),
              ),
              child: Column(
                children: [
                  //Topic of the thread
                  Container(
                    margin: const EdgeInsets.only(top: 12, left: 10), //Margins
                    child: const Text(
                      'Topic', //Text inside the topic widget
                      style: TextStyle(fontSize: 20), //Adjust the font size
                    ),
                  ),
                  SizedBox(
                    height: 650,
                    child: Column(
                      children: [
                        Expanded(
                          //Add the chats to inside the background widget
                          child: ListView.builder(
                            itemCount: _chats
                                .length, //Build list items when a user submits a chat
                            itemBuilder: (BuildContext context, int index) {
                              //Container whcih holds a chat
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5), //Margins
                                padding: const EdgeInsets.all(5), //Padding
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(182, 255, 193,
                                      7), //COlor of the widget holds chats
                                  borderRadius: BorderRadius.circular(
                                      10), //Make the corners round
                                ),
                                child: Text(_chats[
                                    index]), //Put the chat inside the widgets accordingly
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Text(message) input field and the send button
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10), //Padding
                    child: Row(
                      children: [
                        Expanded(
                          //Text(message) input field
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText:
                                  'Enter the message', //Hint text inside the text input field
                            ),
                            onSubmitted: (value) {
                              setState(() {
                                _chats.add(
                                    value); //Add the message to the list when submits
                              });
                              _chatController
                                  .clear(); //Make the chat controller clear
                            },
                          ),
                        ),
                        //Send button
                        IconButton(
                          icon: const Icon(Icons.send), //Send icon
                          onPressed: () {
                            //When pressed
                            final value = _chatController.text
                                .trim(); //Assign the text message to the value variable
                            if (value.isNotEmpty) {
                              //If the value is not empty
                              setState(() {
                                _chats.add(value); //Add the value to the list
                                _chatController
                                    .clear(); //Clear the chatController
                              });
                            }
                          },
                        )
                      ],
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
