import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.user_login),
              child: const Text(
                "Victim",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          const Text(
            "or",
            style: TextStyle(fontSize: 30),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, RoutesName.agency_login),
            child: const Text(
              "Agency",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
