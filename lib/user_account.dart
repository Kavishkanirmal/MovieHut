import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

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
                icon: const Icon(Icons.logout_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomePage()), //Redirect to the homepage when log out clicked
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

          //Adding the search field
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Make it center horizontally
            children: [
              Container(
                margin:
                    const EdgeInsets.only(top: 72), //Add a margin only on top
                child: SizedBox(
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
              ),
            ],
          ),

          //Ratings and reviews widgets
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Ratings widget
              Container(
                margin: const EdgeInsets.only(top: 140), //Add a margin
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), //Make the edges curved
                  color: const Color.fromARGB(102, 254, 253, 253),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //Make the text center
                  children: const [
                    //Add a text
                    Text(
                      'Ratings',
                      style: TextStyle(
                        fontSize: 20, //Change the font size
                      ),
                    ),
                  ],
                ),
              ),

              //Space in between the widgets
              const SizedBox(
                width: 15,
              ),
              //Reviews widget
              Container(
                margin: const EdgeInsets.only(top: 140), //Add a margin
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), //Make the edges curved
                  color: const Color.fromARGB(102, 254, 253, 253),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //Make the text center
                  children: const [
                    //Add a text
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20, //Change the font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Add the "Watchlist" text
          Container(
            margin: const EdgeInsets.only(top: 342, left: 22), //Margins
            child: const Text(
              'Watchlist',
              style: TextStyle(
                fontSize: 20, //Change the font size
              ),
            ),
          ),

          //Add the watchlist widget list
          Container(
            //margins
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 370),
            height: 180,
            //build the widgets
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //Scroll direction
              itemCount: 5, //Number of widget items
              itemBuilder: (context, index) {
                return Container(
                  //Size of the items
                  height: 165,
                  width: 135,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)), //Make the corners curved
                    color: Color.fromARGB(102, 254, 253, 253),
                  ),
                );
              },
            ),
          ),

          //Add the "Recently Viewed" text
          Container(
            margin: const EdgeInsets.only(top: 570, left: 22), //Margins
            child: const Text(
              'Recently Viewed',
              style: TextStyle(
                fontSize: 20, //Change the font size
              ),
            ),
          ),

          //Add the recently viewed widget list
          Container(
            //margins
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 600),
            height: 180,
            //build the widgets
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //Scroll direction
              itemCount: 5, //Number of widget items
              itemBuilder: (context, index) {
                return Container(
                  //Size of the items
                  height: 165,
                  width: 135,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)), //Make the corners curved
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
