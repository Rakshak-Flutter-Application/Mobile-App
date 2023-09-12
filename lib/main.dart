import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/route.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.choice,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
