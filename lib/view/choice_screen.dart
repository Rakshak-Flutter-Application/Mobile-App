import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(163, 173, 251, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
          ),
          Center(
            child: Text(
              "रक्षक",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: size.height * .2,
          ),
          RoundButton(
              text: 'Citizen',
              func: () => Navigator.pushNamed(context, RoutesName.user_login)),
          RoundButton(
              text: 'Agency',
              func: () =>
                  Navigator.pushNamed(context, RoutesName.agency_login)),
        ],
      ),
    );
  }
}
