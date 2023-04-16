import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteMovies = prefs.getStringList('favoriteMovies') ?? [];
    });
  }

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
          Container(
            margin: const EdgeInsets.only(top: 60, left: 25),
            height: 800,
            width: 360,
            child: ListView.builder(
              scrollDirection: Axis.vertical, //Set scrolling direction
              itemCount:
                  favoriteMovies.length, //Get the number of items in the list
              itemBuilder: (context, index) {
                String movieDetails = favoriteMovies[index];
                List<String> details = movieDetails.split('|');
                // return InkWell(
                //   onTap: () {},
                //   child: ListTile(
                //     title: Text(details[0]),
                //     subtitle: Text(details[1]),
                //   ),
                // );
                return InkWell(
                  onTap: () {},
                  child: Container(
                    //Set the size of each widget
                    height: 150,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
