import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/description_page.dart';
import 'package:movie_hut/forum_page.dart';
import 'package:movie_hut/login_page.dart';
import 'package:movie_hut/navigation_drawer.dart';
import 'package:movie_hut/poll_page.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = []; //List to store the trending movies
  List topRatedMovies = []; //List to store the top rated movies
  String apiKey = "4818980254750dc79dd7f5f5f9bff4ad"; //Store the API key
  //Store the read access token
  String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODE4OTgwMjU0NzUwZGM3OWRkN2Y1ZjVmOWJmZjRhZCIsInN1YiI6IjY0Mzk3MDU1NzY0NmZkMDBiM2ExZDZlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XNI4n694p5wQgvVfCMKzIKTgjxbrfQBtCiZTPVevu-w";

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

//Function to fetch the data from the API
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingMovieResults =
        await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMovieResults = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      trendingMovies =
          trendingMovieResults['results']; //Store the details in the list
      topRatedMovies =
          topRatedMovieResults['results']; //Store the details in the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Setting the background color of the page
      // backgroundColor: Colors.transparent,
      extendBodyBehindAppBar:
          true, //To make the body visible through the appbar
      drawer: const MenuDrawer(), //Calling the drawer widget
      appBar: AppBar(
        //Changing the color of the icons
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle
            .dark, //To make the status and navigation bars dark
        elevation: 0, //Remove the shadows to make it complete transparent
        //Login button
        actions: [
          SizedBox(
            width: 400,
            height: 10,
            child: Align(
              alignment: const Alignment(-0.81, 0),
              child: IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage()), //Redirect to the login when login clicked
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: 1200,
        //Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Home page background.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  bottom: 18, top: 80), //Add a margin on top and bottom
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, //Make it center horizontally
                children: [
                  SizedBox(
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
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              height: 160,
              //Main banners
              child: ListView.builder(
                scrollDirection: Axis.horizontal, //Set scrolling direction
                itemCount:
                    trendingMovies.length, //Get the number of items in the list
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                            name: trendingMovies[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['poster_path'],
                            description: trendingMovies[index]['overview'],
                            vote: (trendingMovies[index]['vote_average']
                                .toString()),
                            launchedDate: trendingMovies[index]['release_date'],
                          ), //Navigate to the Poll page when widget clicked
                        ),
                      );
                    },
                    child: Container(
                      //Set the size of each widget
                      height: 160,
                      width: 370,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        //Get the poster and display
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  trendingMovies[index]['backdrop_path']),
                          fit: BoxFit.fill, //Make the poster fill the widget
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 125),
                        child: Center(
                          //Display the title of the movie
                          child: Text(
                            trendingMovies[index]['title'] != null
                                ? trendingMovies[index]['title']
                                : 'Loading..',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //Message
            const SizedBox(
              width: 300,
              height: 30,
              child: Align(
                alignment: Alignment(-1.55, 0),
                child: Text(
                  "Top Rated Movies",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 1),
              height: 180,
              //widget row below the message
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    trendingMovies.length, //Get the number of items in the list
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                            name: topRatedMovies[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                topRatedMovies[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                topRatedMovies[index]['poster_path'],
                            description: topRatedMovies[index]['overview'],
                            vote: (topRatedMovies[index]['vote_average']
                                .toString()),
                            launchedDate: topRatedMovies[index]['release_date'],
                          ), //Navigate to the Poll page when widget clicked
                        ),
                      );
                    },
                    child: Container(
                      height: 165,
                      width: 135,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        //Get the poster and display
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  topRatedMovies[index]['poster_path']),
                          fit: BoxFit.cover, //Make the poster fill the widget
                        ),
                      ),
                      // child: Container(
                      //   margin:
                      //       const EdgeInsets.only(top: 125, left: 5, right: 5),
                      //   child: Center(
                      //     //Display the title of the movie
                      //     child: Text(
                      //       trendingMovies[index]['title'] != null
                      //           ? trendingMovies[index]['title']
                      //           : 'Loading..',
                      //       style: const TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  );
                },
              ),
            ),
            //Poll
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const PollPage(), //Navigate to the Poll page when widget clicked
                  ),
                );
              },
              child: Container(
                height: 150,
                width: 370,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  //Adding the cover image
                  image: DecorationImage(
                    image: AssetImage('assets/Poll Background.PNG'),
                    fit: BoxFit.fill,
                  ),
                  //color: Color.fromARGB(102, 254, 253, 253),
                ),
              ),
            ),
            //Forum
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ForumPage(), //Navigate to the forum page when widget clicked
                  ),
                );
              },
              child: Container(
                //size of the widget
                height: 150,
                width: 370,
                margin: const EdgeInsets.only(top: 10), //Margins
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ), //Make the corners curved
                  //Adding the cover image
                  image: DecorationImage(
                    image: AssetImage('assets/Forum Background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
