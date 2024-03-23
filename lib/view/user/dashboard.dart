import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({super.key});

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset(
          "assets/home_bg.png",
          fit: BoxFit.cover,
          width: size.width * 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * .1, horizontal: size.width * .05),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "रक्षक",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Ajay Nagar",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/logo.png",
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .05,
              ),
              Text(
                "Upcoming Events",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: size.width * .02,
              ),
              SizedBox(
                height: size.height * .15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: size.width * .05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/up_events.png",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * .05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/up_events.png",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * .05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/up_events.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * .05,
              ),
              Text(
                "Latest News",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width * .02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * .01, horizontal: size.width * .02),
                width: size.width * 1,
                color: Color.fromRGBO(189, 195, 244, 0.9),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'NDRF conducts SAR (Search and Rescue) and Flood Water Rescue operations in the areas after Flash Flood',
                      speed: Duration(milliseconds: 60),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Card(
                elevation: 18,
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: size.height * .15,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 62, 157),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/cloudy.png",
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/temparature1.png",
                                    scale: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Max",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "25°C",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/temparature1.png",
                                    scale: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Min",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "10°C",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: size.width * .06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, RoutesName.emergency_contact),
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(158, 169, 255, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/emergency_contact.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Emergency\nContacts",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .15,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 214, 255, 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/ssprog.png",
                            width: size.width * .17,
                          ),
                          Text(
                            "School Safety\nProgramme",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, RoutesName.list),
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 214, 255, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/calendar.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Previous Disaster\nSheet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.user_event),
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(158, 169, 255, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/event.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Events",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.quizzes),
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(158, 169, 255, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/quiz.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Quizinga",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.choice_game),
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 214, 255, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/game.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Safety Game",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: AppBar(
      //     backgroundColor: AppColors.buttonColor,
      //     centerTitle: true,
      //     title: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const Text(
      //           "Rakshak SoS",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 52.0),
      //           child: IconButton(
      //               onPressed: () {},
      //               icon: const Icon(
      //                 Icons.notifications,
      //                 size: 35,
      //               )),
      //         ),
      //         IconButton(
      //             onPressed: () {},
      //             icon: const Icon(
      //               Icons.settings,
      //               size: 35,
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(22.0),
      //         child: Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             "Hi, Sneha 😊",
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       //weather ans SOS
      //       Row(
      //         //weather updates
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Expanded(
      //             child:
      // Card(
      //               elevation: 18,
      //               child: Container(
      //                 height: size.height * .15,
      //                 width: size.width * .5,
      //                 decoration: BoxDecoration(
      //                     color: Color.fromARGB(255, 125, 90, 231),
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: Center(
      //                   child: Text(
      //                     "Weather Update",
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           //sos
      //           Expanded(
      //             child: Card(
      //               elevation: 18,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                     color: Colors.red.shade500,
      //                     borderRadius: BorderRadius.circular(10)),
      //                 height: size.height * .15,
      //                 width: size.width * .5,
      //                 child: Center(
      //                   child: Text(
      //                     "SOS",
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),

      //       //datasheet
      //       Card(
      //         elevation: 20,
      //         child: Container(
      //           width: double.infinity,
      //           height: 60,
      //           child: InkWell(
      //             onTap: () {},
      //             child: SizedBox(
      //               width: size.width * .6,
      //               child: GestureDetector(
      // onTap: () =>
      //     Navigator.pushNamed(context, RoutesName.list),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Center(
      //                     child: Text(
      //                       "Previous Disaster Datasheet",
      //                       style: TextStyle(
      //                         color: Colors.grey.shade500,
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       //MEssages

      //       Padding(
      //         padding: const EdgeInsets.all(14.0),
      //         child: Container(
      //           height: size.height * .2,
      //           width: size.width * .96,
      //           child: Card(
      //             elevation: 5,
      //             child: Column(
      //               children: [
      //                 Card(
      //                   elevation: 4,
      //                   child: Text(
      //                     "Messages",
      //                     style: TextStyle(
      //                         fontSize: 22, fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(25.0),
      //                   child: Text("No new messages yet",
      //                       style: TextStyle(fontSize: 18, color: Colors.grey)),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       //agency list
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Card(
      //           elevation: 20,
      //           child: Container(
      //             width: double.infinity,
      //             height: 80,
      //             child: InkWell(
      //               onTap: () {},
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(20.0),
      //                       child: Text(
      //                         "Agency List",
      //                         style:
      //                             TextStyle(color: Colors.black, fontSize: 20),
      //                       ),
      //                     ),
      //                   ),
      //                   // Image.asset(
      //                   //   'assets/images/agency_contact_list.jpg',
      //                   //   scale: 15,
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),

      //       //Emergency contact list
      //       Card(
      //         elevation: 5,
      //         child: Container(
      //           height: size.height * .5,
      //           width: size.height * .45,
      //           child: Column(
      //             children: [
      //               Text(
      //                 "Emergency Contact List",
      //                 style:
      //                     TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 12.0),
      //                 child: Container(
      //                   height: 50,
      //                   color: Color.fromARGB(255, 218, 202, 240),
      //                   child: const Center(
      //                       child: Text('National Emergency Number')),
      //                 ),
      //               ),
      //               Container(
      //                 height: 50,
      //                 color: Color.fromARGB(255, 218, 202, 240),
      //                 child: const Center(child: Text('Fire')),
      //               ),
      //               Container(
      //                 height: 50,
      //                 color: Color.fromARGB(255, 218, 202, 240),
      //                 child: const Center(child: Text('Police')),
      //               ),
      //               Container(
      //                 height: 50,
      //                 color: Color.fromARGB(255, 218, 202, 240),
      //                 child: const Center(child: Text('Ambulance')),
      //               ),
      //               Container(
      //                 height: 50,
      //                 color: Color.fromARGB(255, 218, 202, 240),
      //                 child: const Center(child: Text('Women Helpline')),
      //               ),
      //               Container(
      //                 height: 50,
      //                 color: Color.fromARGB(255, 218, 202, 240),
      //                 child: const Center(
      //                     child: Text(
      //                         'Relief Commissioner For Natural Calamities')),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),

      //       //quiz
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Card(
      //           elevation: 20,
      //           child: Container(
      //             width: double.infinity,
      //             height: 80,
      //             child: InkWell(
      //               onTap: () {},
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     width: size.width * .6,
      //                     child: GestureDetector(
      //                       onTap: () => Navigator.pushNamed(
      //                           context, RoutesName.quizzes),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Text(
      //                           "Quizzzzzz",
      //                           style: TextStyle(
      //                               color: Colors.black, fontSize: 20),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   // Image.asset(
      //                   //   'assets/images/quiz_logo.jpg',
      //                   //   scale: 15,
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Card(
      //           elevation: 20,
      //           child: Container(
      //             width: double.infinity,
      //             height: 80,
      //             child: InkWell(
      //               onTap: () {},
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     width: size.width * .6,
      //                     child: GestureDetector(
      //                       onTap: () => Navigator.pushNamed(
      //                           context, RoutesName.choice_game),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Text(
      //                           "Safety Gamme",
      //                           style: TextStyle(
      //                               color: Colors.black, fontSize: 20),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FloatingActionButton(
      //       child: Icon(
      //         Icons.child_care,
      //         size: 29,
      //       ),
      //       backgroundColor: AppColors.buttonColor,
      //       onPressed: () {}),
      // ),
    );
  }
}
