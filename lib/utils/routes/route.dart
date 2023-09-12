import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/view/agency/homescreen.dart';
import 'package:rakshak_sos/view/agency/login_screen.dart';
import 'package:rakshak_sos/view/agency/signup_screen.dart';
import 'package:rakshak_sos/view/user/home_screen.dart';
import 'package:rakshak_sos/view/user/login_screen.dart';
import 'package:rakshak_sos/view/user/otp_screen.dart';
import 'package:rakshak_sos/view/user/signup_screen.dart';
import 'package:rakshak_sos/view/choice_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.user_home:
        return MaterialPageRoute(builder: (context) => const UserHomeScreen());
      case RoutesName.agency_home:
        return MaterialPageRoute(
            builder: (context) => const AgencyHomeScreen());
      case RoutesName.user_login:
        return MaterialPageRoute(builder: (context) => const UserLoginScreen());
      case RoutesName.agency_login:
        return MaterialPageRoute(
            builder: (context) => const AgencyLoginScren());
      case RoutesName.user_signup:
        return MaterialPageRoute(
            builder: (context) => const UserSignupScreen());
      case RoutesName.agency_signup:
        return MaterialPageRoute(
            builder: (context) => const AgencySignupScren());
      case RoutesName.choice:
        return MaterialPageRoute(builder: (context) => const ChoiceScreen());
      case RoutesName.otp:
        return MaterialPageRoute(builder: (context) => const OTPScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
