import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({super.key});

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Agency Home Screen",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.agency_event),
                child: const Text("Create Event"))
          ],
        ),
      ),
    );
  }
}
