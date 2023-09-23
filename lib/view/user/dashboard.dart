import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({super.key});

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppColors.buttonColor,
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Rakshak SoS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 52.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 35,
                    )),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 35,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hi, Sneha 😊",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //weather ans SOS
            Row(
              //weather updates
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    elevation: 18,
                    child: Container(
                      height: size.height * .15,
                      width: size.width * .5,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 125, 90, 231),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Weather Update",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                //sos
                Expanded(
                  child: Card(
                    elevation: 18,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: BorderRadius.circular(10)),
                      height: size.height * .15,
                      width: size.width * .5,
                      child: Center(
                        child: Text(
                          "SOS",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //datasheet
            Card(
              elevation: 20,
              child: Container(
                width: double.infinity,
                height: 60,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: size.width * .6,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RoutesName.list),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Previous Disaster Datasheet",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //MEssages

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: size.height * .2,
                width: size.width * .96,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text("No new messages yet",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //agency list
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .6,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Agency List",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/agency_contact_list.jpg',
                          scale: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Emergency contact list
            Card(
              elevation: 5,
              child: Container(
                height: size.height * .5,
                width: size.height * .45,
                child: Column(
                  children: [
                    Text(
                      "Emergency Contact List",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 218, 202, 240),
                        child: const Center(
                            child: Text('National Emergency Number')),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Color.fromARGB(255, 218, 202, 240),
                      child: const Center(child: Text('Fire')),
                    ),
                    Container(
                      height: 50,
                      color: Color.fromARGB(255, 218, 202, 240),
                      child: const Center(child: Text('Police')),
                    ),
                    Container(
                      height: 50,
                      color: Color.fromARGB(255, 218, 202, 240),
                      child: const Center(child: Text('Ambulance')),
                    ),
                    Container(
                      height: 50,
                      color: Color.fromARGB(255, 218, 202, 240),
                      child: const Center(child: Text('Women Helpline')),
                    ),
                    Container(
                      height: 50,
                      color: Color.fromARGB(255, 218, 202, 240),
                      child: const Center(
                          child: Text(
                              'Relief Commissioner For Natural Calamities')),
                    ),
                  ],
                ),
              ),
            ),

            //quiz
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .6,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RoutesName.quizzes),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Quizzzzzz",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/quiz_logo.jpg',
                          scale: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .6,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RoutesName.choice_game),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Safety Gamme",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            child: Icon(
              Icons.child_care,
              size: 29,
            ),
            backgroundColor: AppColors.buttonColor,
            onPressed: () {}),
      ),
    );
  }
}
