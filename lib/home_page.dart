import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/forum_page.dart';
import 'package:movie_hut/login_page.dart';
import 'package:movie_hut/navigation_drawer.dart';
import 'package:movie_hut/poll_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 160,
                    width: 370,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(102, 254, 253, 253),
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
                  "Top picks for you",
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
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
