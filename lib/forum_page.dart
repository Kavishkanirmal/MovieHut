import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';
import 'package:movie_hut/new_thread.dart';
import 'package:movie_hut/thread.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  int itemCount = 2; //Variable use to determine number of threads

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
                icon: const Icon(Icons.home), //Home icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HomePage(), //Redirect to the homepage when log out clicked
                    ),
                  );
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
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center, //Make the following widget center in the page
            children: [
              Container(
                //Sizes of the widget
                height: 40,
                width: 120,
                margin: const EdgeInsets.only(top: 90), //Margin of the widget

                child: ElevatedButton(
                  onPressed: () {
                    //Navigate to the relevant page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewThread(),
                      ),
                    );
                  },
                  //Customize the button
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(175, 254, 253, 253),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                    //Make the text center of the widget
                    child: Text(
                      'New Thread',
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

          Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, bottom: 8, top: 150), //Margins
            height: 750, //Height of the list
            //Thread widgets
            child: ListView.builder(
              scrollDirection: Axis.vertical, //Define the scrolling axis
              itemCount: itemCount, //Number of widgets in the list
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //Navigate to the relevant page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Thread(),
                      ),
                    );
                  },
                  child: Container(
                    //Size of each widget
                    height: 150,
                    width: 370,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(102, 254, 253, 253),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
