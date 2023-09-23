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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.red,
            height: size.height * .1,
            width: size.width * .2,
          ),
          Center(
            child: Text(
              "RAKSHAK SOS",
              style: Theme.of(context).textTheme.displayLarge,
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
