import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/route.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textSize = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.bgColor,
          scaffoldBackgroundColor: Color.fromARGB(255, 235, 180, 255),
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.iconColor)),
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontSize: textSize * .03, color: AppColors.textColor),
              bodyMedium: TextStyle(fontSize: textSize * .04),
              headlineLarge: TextStyle(
                  fontSize: textSize * .2, color: AppColors.textColor),
              displayLarge: TextStyle(
                  fontSize: textSize * .1, color: AppColors.textColor))),
      initialRoute: RoutesName.choice_game,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
