import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';

class DescriptionPage extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchedDate;

  const DescriptionPage(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchedDate});

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

          //Container of the banner
          Container(
            //Set the margins and sizes of background widget
            margin: const EdgeInsets.only(top: 80, left: 15),
            height: 250,
            width: 380,
            decoration: BoxDecoration(
              color: const Color.fromARGB(144, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              //Set the margins and sizes
              margin: const EdgeInsets.only(bottom: 50),
              height: 200,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //Set the image
                image: DecorationImage(
                  image: NetworkImage(
                    bannerurl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //Container of the ratings
          Container(
            margin: const EdgeInsets.only(top: 290, left: 290),
            child: Text(
              " ⭐ $vote /10",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          //Container of the name
          Container(
            margin: const EdgeInsets.only(top: 290, left: 30),
            child: Text(
              name != null ? name : "Name Not Loaded!",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          //Details section
          //Make it scrollable
          SingleChildScrollView(
            scrollDirection: Axis.vertical, //Set the scrollable axis
            child: Container(
              height: 500,
              width: 380,
              margin: const EdgeInsets.only(top: 330, left: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(146, 28, 54, 113), //Set the color
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    //Details text (Heading)
                    child: const Text(
                      "Details:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 45, left: 20),
                    child: Text(
                      "Released Date:  $launchedDate",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 80, left: 10, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 150,
                          child: Image.network(posterurl),
                        ),
                        Flexible(
                          child: Text(
                            description,
                            style: const TextStyle(color: Colors.white),
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
    );
  }
}
