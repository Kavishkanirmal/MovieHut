import 'package:flutter/material.dart';
import 'package:movie_hut/airing_today_tv_results.dart';
import 'package:movie_hut/now_playing_movie_results.dart';
import 'package:movie_hut/on_the_air_tv_results.dart';
import 'package:movie_hut/popular_movie_results.dart';
import 'package:movie_hut/popular_tv_show_results.dart';

import 'package:movie_hut/top_rated_movie_results.dart';
import 'package:movie_hut/top_rated_tv_show_results.dart';
import 'package:movie_hut/upcoming_movie_results.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
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
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  //Heading of the drawer
  Widget buildHeader(BuildContext context) => Container(
        // padding: EdgeInsets.only(
        //   top: MediaQuery.of(context).padding.top,
        // ),
        margin: const EdgeInsets.only(top: 35),
        child: const Center(
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 23),
          ),
        ),
      );

  //Items of the drawer
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          //Movies heading
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Movies',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {},
          ),
          //line divider
          const Divider(
            thickness: 3,
            indent: 14,
            endIndent: 25,
          ),
          //Top Rated Movies sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Top Rated Movies',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TopRatedMoviesPage(),
                ),
              );
            },
          ),
          //Upcoming Movies sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Upcoming Movies',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpcomingMoviesPage(),
                ),
              );
            },
          ),
          //Now Playing Movies sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Now Playing Movies',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NowPlayingMoviesPage(),
                ),
              );
            },
          ),
          //Popular Movies sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Popular Movies',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PopularMoviesPage(),
                ),
              );
            },
          ),

          //Tv shows heading
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              title: const Text(
                'TV Shows',
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {},
            ),
          ),
          //line divider
          const Divider(
            thickness: 3,
            indent: 14,
            endIndent: 25,
          ),
          //Popular TV Shows sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Popular TV Shows',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PopularTvPage(),
                ),
              );
            },
          ),
          //Top Rated TV Shows title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Top Rated TV Shows',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TopRatedTvPage(),
                ),
              );
            },
          ),
          //On The Air TV Shows sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'On The Air TV Shows',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnTheAirTvPage(),
                ),
              );
            },
          ),
          //Airing Today sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Airing Today',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AiringTodayTvPage(),
                ),
              );
            },
          ),
        ],
      );
}
