import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

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

          //Search field
          Container(
            margin: const EdgeInsets.only(top: 80, left: 20),
            width: 370,
            height: 45,
            //Search field
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), //Add a prefix icon
                hintText: "Search", //Hint text of the field
                filled: true, //Make the inside filled with some color
                fillColor: Color.fromARGB(174, 240, 219, 219),
                //Border of the search field
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  //Make the edges curved
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ),

          //Search query
          Container(
            margin: const EdgeInsets.only(top: 140, left: 180),
            child: const Text(
              "hello",
              style: TextStyle(fontSize: 20),
            ),
          ),

          //Display the movies (container -1)
          Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, bottom: 5, top: 200), //Margins
            height: 180, //Set the height of the container
            //Build a row of widgets
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //Set scrolling direction
              itemCount: 10, //Number of items in the row
              itemBuilder: (context, index) {
                return Container(
                  //Set the size of each widget
                  height: 165,
                  width: 135,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(102, 254, 253, 253),
                  ),
                );
              },
            ),
          ),

          //Display the movies (container -2)
          Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, bottom: 5, top: 400), //Margins
            height: 180, //Set the height of the container
            //Build a row of widgets
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //Set scrolling direction
              itemCount: 10, //Number of items in the row
              itemBuilder: (context, index) {
                return Container(
                  //Set the size of each widget
                  height: 165,
                  width: 135,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(102, 254, 253, 253),
                  ),
                );
              },
            ),
          ),

          //Display the movies (container -3)
          Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, bottom: 5, top: 600), //Margins
            height: 180, //Set the height of the container
            //Build a row of widgets
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //Set scrolling direction
              itemCount: 10, //Number of items in the row
              itemBuilder: (context, index) {
                return Container(
                  //Set the size of each widget
                  height: 165,
                  width: 135,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(102, 254, 253, 253),
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
