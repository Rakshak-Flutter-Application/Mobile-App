import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/route.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/view_model/auth_view_model.dart';
import 'package:rakshak_sos/view_model/event_view_model.dart';
import 'package:rakshak_sos/view_model/user_view_model.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserViewModel>(create: (_) => UserViewModel()),
        Provider<AuthViewModel>(create: (_) => AuthViewModel()),
        Provider<EventProvider>(create: (_) => EventProvider()),
      ],
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textSize = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: AppColors.bgColor,
          scaffoldBackgroundColor: AppColors.screenColor,
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: AppColors.textColor),
              backgroundColor: AppColors.iconColor,
              iconTheme: IconThemeData(color: AppColors.generalColor)),
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontSize: textSize * .03, color: AppColors.textColor),
              bodyMedium: TextStyle(fontSize: textSize * .04),
              headlineLarge: TextStyle(
                  fontSize: textSize * .2, color: AppColors.textColor),
              displayLarge: TextStyle(
                  fontSize: textSize * .1, color: AppColors.textColor))),
      initialRoute: RoutesName.choice,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
