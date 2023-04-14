import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hut/navigation_drawer.dart';

class PollPage extends StatefulWidget {
  const PollPage({super.key});

  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  final List<int> _totalClicks = [1, 1, 1, 1]; //list to keep track of clicked

  //Lists to store the percentages of each poll
  final List<double> _button1Percentage = [1, 1, 1, 1];
  final List<double> _button2Percentage = [1, 1, 1, 1];
  final List<double> _button3Percentage = [1, 1, 1, 1];
  final List<double> _button4Percentage = [1, 1, 1, 1];

  //List to store the headings of the polls
  List<String> headings = [
    '30th Jan on &flix',
    '20th Feb on HBO',
    '30th Mar on &flix',
    '1st Apr on HBO'
  ];

  //List to store the headings of the polls
  List<String> times = ['8 pm', '12 pm', '9 pm', '1 pm'];

  //Lists to keep track whether the button is clicked
  final List<bool> _button1Clicked = [false, false, false, false];
  final List<bool> _button2Clicked = [false, false, false, false];
  final List<bool> _button3Clicked = [false, false, false, false];
  final List<bool> _button4Clicked = [false, false, false, false];

  //Lists to keep track of the button clicked times
  final List<int> _button1 = [1, 1, 1, 1];
  final List<int> _button2 = [1, 1, 1, 1];
  final List<int> _button3 = [1, 1, 1, 1];
  final List<int> _button4 = [1, 1, 1, 1];

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
        //Back button
        actions: [
          SizedBox(
            width: 400,
            height: 10,
            child: Align(
              alignment: const Alignment(-0.81, 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(); //Go back
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          //Add the background image
          Image.asset(
            'assets/Home page background.PNG',
            //Make the image fill the page
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          //Add the polls
          Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, bottom: 8, top: 20), //Margins
            height: 800, //Height of the list
            //Thread widgets
            child: ListView.builder(
              scrollDirection: Axis.vertical, //Define the scrolling axis
              itemCount: 4, //Number of widgets in the list
              itemBuilder: (context, index) {
                //Calculate the total clicks and the percentages
                for (int i = 0; i < 4; i++) {
                  _totalClicks[i] =
                      _button1[i] + _button2[i] + _button3[i] + _button4[i];
                  _button1Percentage[i] =
                      ((_button1[i] / _totalClicks[i]) * 100);
                  _button2Percentage[i] =
                      ((_button2[i] / _totalClicks[i]) * 100);
                  _button3Percentage[i] =
                      ((_button3[i] / _totalClicks[i]) * 100);
                  _button4Percentage[i] =
                      ((_button4[i] / _totalClicks[i]) * 100);
                }

                //Function to handle button -1
                void onButton1Pressed() {
                  setState(() {
                    _button1Clicked[index] = !_button1Clicked[
                        index]; //Each time button clicked it will set button clicked as opposite of it
                    if (_button1Clicked[index]) {
                      _button1[index]++; //If clicked increase the count
                    } else {
                      _button1[index]--; //Else decrease the count
                    }
                  });
                }

                //Function to handle button -2
                void onButton2Pressed() {
                  setState(() {
                    _button2Clicked[index] = !_button2Clicked[
                        index]; //Each time button clicked it will set button clicked as opposite of it
                    if (_button2Clicked[index]) {
                      _button2[index]++; //If clicked increase the count
                    } else {
                      _button2[index]--; //Else decrease the count
                    }
                  });
                }

                //Function to handle button -3
                void onButton3Pressed() {
                  setState(() {
                    _button3Clicked[index] = !_button3Clicked[
                        index]; //Each time button clicked it will set button clicked as opposite of it
                    if (_button3Clicked[index]) {
                      _button3[index]++; //If clicked increase the count
                    } else {
                      _button3[index]--; //Else decrease the count
                    }
                  });
                }

                //Function to handle button -4
                void onButton4Pressed() {
                  setState(() {
                    _button4Clicked[index] = !_button4Clicked[
                        index]; //Each time button clicked it will set button clicked as opposite of it
                    if (_button4Clicked[index]) {
                      _button4[index]++; //If clicked increase the count
                    } else {
                      _button4[index]--; //Else decrease the count
                    }
                  });
                }

                return InkWell(
                  onTap: () {},
                  child: Container(
                    //Size of each widget
                    height: 200,
                    width: 370,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(102, 254, 253, 253),
                    ),
                    //Content inside each container
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          //Get the hadings from the list
                          child: Text(
                            headings[index],
                            style: const TextStyle(
                                fontSize: 20), //Change the font size
                          ),
                        ),
                        //Add the telecast time
                        Text(
                          //Get the data from the list
                          times[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                        Column(
                          children: [
                            //Row -1
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround, //Set alignment
                              children: [
                                //Button -1
                                ElevatedButton(
                                  onPressed: onButton1Pressed,
                                  //If the button clicked change the color and if unclicked bring back to normal
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _button1Clicked[index]
                                        ? Colors.amber
                                        : null,
                                  ),
                                  child:
                                      const Text("Movie 1"), //Name of the movie
                                ),

                                //Button -2
                                ElevatedButton(
                                  onPressed: onButton2Pressed,

                                  //If the button clicked change the color and if unclicked bring back to normal
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _button2Clicked[index]
                                        ? Colors.amber
                                        : null,
                                  ),
                                  child:
                                      const Text("Movie 2"), //Name of the movie
                                ),
                              ],
                            ),

                            //Row -2
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround, //Set alignment
                              children: [
                                //Poll bar -1
                                Container(
                                  //Check if the number is not a number or a infinite number
                                  width: _button1Percentage[index].isNaN ||
                                          _button1Percentage[index].isInfinite
                                      ? 0 //if condition met set the width to zero
                                      : _button1Percentage[
                                          index], //Else set the width to percentage of relevant poll
                                  height: 20, //Set height
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                //Poll bar -2
                                Container(
                                  //Check if the number is not a number or a infinite number
                                  width: _button2Percentage[index].isNaN ||
                                          _button2Percentage[index].isInfinite
                                      ? 0 //if condition met set the width to zero
                                      : _button2Percentage[
                                          index], //Else set the width to percentage of relevant poll
                                  height: 20, //Set height
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),

                            //Row -3
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround, //Set alignment
                              children: [
                                //Button -3
                                ElevatedButton(
                                  onPressed: onButton3Pressed,
                                  //If the button clicked change the color and if unclicked bring back to normal
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _button3Clicked[index]
                                        ? Colors.amber
                                        : null,
                                  ),
                                  child:
                                      const Text("Movie 3"), //Name of the movie
                                ),

                                //Button -4
                                ElevatedButton(
                                  onPressed: onButton4Pressed,
                                  //If the button clicked change the color and if unclicked bring back to normal
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _button4Clicked[index]
                                        ? Colors.amber
                                        : null,
                                  ),
                                  child:
                                      const Text("Movie 4"), //Name of the movie
                                ),
                              ],
                            ),

                            //Row -4
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround, //Set alignment
                              children: [
                                //Poll bar -3
                                Container(
                                  //Check if the number is not a number or a infinite number
                                  width: _button3Percentage[index].isNaN ||
                                          _button3Percentage[index].isInfinite
                                      ? 0 //if condition met set the width to zero
                                      : _button3Percentage[
                                          index], //Else set the width to percentage of relevant poll
                                  height: 20, //Set height
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                //Poll bar -4
                                Container(
                                  //Check if the number is not a number or a infinite number
                                  width: _button4Percentage[index].isNaN ||
                                          _button4Percentage[index].isInfinite
                                      ? 0 //if condition met set the width to zero
                                      : _button4Percentage[
                                          index], //Else set the width to percentage of relevant poll
                                  height: 20, //Set height
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
