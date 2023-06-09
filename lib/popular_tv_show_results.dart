import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/description_page.dart';
import 'package:movie_hut/home_page.dart';
import 'package:movie_hut/navigation_drawer.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PopularTvPage extends StatefulWidget {
  const PopularTvPage({super.key});

  @override
  State<PopularTvPage> createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  List popularTv = []; //List to store the movies
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

    Map topRatedMovieResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      popularTv =
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
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ), //Redirect to the home page
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
              ),
            ),
            const Text(
              "Popular TV Shows",
              style: TextStyle(fontSize: 20),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 20, bottom: 8, top: 20),
                height: 800,
                //Banners
                child: ListView.builder(
                  //   scrollDirection: Axis.horizontal, //Set scrolling direction
                  itemCount: popularTv.length, //Set the item count
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              name: popularTv[index]['original_name'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  popularTv[index]['backdrop_path'],
                              posterurl: 'https://image.tmdb.org/t/p/w500' +
                                  popularTv[index]['poster_path'],
                              description: popularTv[index]['overview'],
                              vote:
                                  (popularTv[index]['vote_average'].toString()),
                              launchedDate: popularTv[index]['first_air_date'],
                            ), //Navigate to the Poll page when widget clicked
                          ),
                        );
                      },
                      child: Container(
                        //Set the size of each widget

                        height: 270,
                        width: 170,
                        margin: const EdgeInsets.only(right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          //Get the poster and display
                          image: DecorationImage(
                            image: NetworkImage(
                              popularTv[index]['poster_path'] != null
                                  ? 'https://image.tmdb.org/t/p/w500${popularTv[index]['poster_path']}'
                                  : 'assets/Home page background.PNG',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 240),
                          child: Center(
                            //Display the title of the movie
                            child: Text(
                              popularTv[index]['original_name'] != null
                                  ? popularTv[index]['original_name']
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
            ),
          ],
        ),
      ),
    );
  }
}
