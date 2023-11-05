import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          scale: 2,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Image.asset(
          'assets/ecbg.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.only(top: 120, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Emergency\nContact",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/search.png',
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .04,
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
                              "assets/police.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Police",
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
                            "assets/fire.png",
                            width: size.width * .17,
                          ),
                          Text(
                            "Fire Brigade",
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
                              "assets/medical.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Medical",
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
                              "assets/response.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Emergency\nResponse",
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
                              "assets/local.png",
                              width: size.width * .17,
                            ),
                            Text(
                              "Local\nServices",
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
                              "assets/utility.png",
                              width: size.width * .1,
                            ),
                            Text(
                              "Utility\nServices",
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
    );
  }
}
