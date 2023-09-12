import 'package:flutter/material.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({super.key});

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Agency Home Screen")),
    );
  }
}
