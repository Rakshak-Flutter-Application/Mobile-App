import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class AgencySignupScren extends StatefulWidget {
  const AgencySignupScren({super.key});

  @override
  State<AgencySignupScren> createState() => _AgencySignupScrenState();
}

class _AgencySignupScrenState extends State<AgencySignupScren> {
  @override
  Widget build(BuildContext context) {
    // location
    // Agency ID
    // Name
    // Expertise
    // Description
    // emial
    // phone no
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * .1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Registration",
              style: TextStyle(fontSize: size.width * .1),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Agency ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Agency Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Area of Expertise',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Contact number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .1))),
            ),
            RoundButton(
                func: () =>
                    Navigator.pushNamed(context, RoutesName.agency_home),
                text: 'Save')
          ],
        ),
      ),
    );
  }
}
