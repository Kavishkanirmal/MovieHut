import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),

          //Other heading
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              title: const Text(
                'Other',
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
          //Popular People sub title
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: const Text(
              'Popular People',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {},
          ),
        ],
      );
}
