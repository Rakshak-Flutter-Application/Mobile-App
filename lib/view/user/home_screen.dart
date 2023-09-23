import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("User Home Screen"),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.user_event),
              child: const Text("Event"))
        ],
      )),
    );
  }
}
