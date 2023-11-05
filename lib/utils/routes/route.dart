import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/view/agency/events/create_event_screen.dart';
import 'package:rakshak_sos/view/agency/events/event_list_screen.dart';
import 'package:rakshak_sos/view/agency/homescreen.dart';
import 'package:rakshak_sos/view/agency/login_screen.dart';
import 'package:rakshak_sos/view/agency/signup_screen.dart';
import 'package:rakshak_sos/view/user/dashboard.dart';
import 'package:rakshak_sos/view/user/emergency_contact.dart';
import 'package:rakshak_sos/view/user/event_screen.dart';
import 'package:rakshak_sos/view/choice_game/choice_game.dart';
import 'package:rakshak_sos/view/choice_screen.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/cyclone_datasheet.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/earthquake.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/fire.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/flight.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/floods.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/landslides.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/others.dart';
import 'package:rakshak_sos/view/user/disasterDatasheet/rail.dart';
import 'package:rakshak_sos/view/user/home_screen.dart';
import 'package:rakshak_sos/view/user/list.dart';
import 'package:rakshak_sos/view/user/login_screen.dart';
import 'package:rakshak_sos/view/user/otp_screen.dart';
import 'package:rakshak_sos/view/user/quiz/quiz.dart';
import 'package:rakshak_sos/view/user/signup_screen.dart';

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

      case RoutesName.user_event:
        return MaterialPageRoute(builder: (context) => const UserEventScreen());
      case RoutesName.create_event:
        return MaterialPageRoute(
            builder: (context) => const CreateEventScreen());
      case RoutesName.agency_event:
        return MaterialPageRoute(
            builder: (context) => const AgencyEventScren());
      case RoutesName.otp:
        final String phoneNumber = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (context) => OTPScreen(
                  phoneNumber: phoneNumber,
                ));
      case RoutesName.choice_game:
        return MaterialPageRoute(
            builder: (context) => const EarthquakeSafetyGame());
      case RoutesName.cyclone:
        return MaterialPageRoute(builder: (context) => const Cyclone());
      case RoutesName.list:
        return MaterialPageRoute(builder: (context) => const list());
      case RoutesName.earthquake:
        return MaterialPageRoute(builder: (context) => const Earthquake());
      case RoutesName.floods:
        return MaterialPageRoute(builder: (context) => const Floods());
      case RoutesName.fire:
        return MaterialPageRoute(builder: (context) => const Fire());
      case RoutesName.flight:
        return MaterialPageRoute(builder: (context) => const Flight());
      case RoutesName.landslides:
        return MaterialPageRoute(builder: (context) => const Landslides());
      case RoutesName.rail:
        return MaterialPageRoute(builder: (context) => const Rail());
      case RoutesName.others:
        return MaterialPageRoute(builder: (context) => const Others());
      case RoutesName.user_dashboard:
        return MaterialPageRoute(
            builder: (context) => const UserDashBoardScreen());
      case RoutesName.emergency_contact:
        return MaterialPageRoute(
            builder: (context) => const EmergencyContact());
      case RoutesName.quizzes:
        return MaterialPageRoute(builder: (context) => const QuizIt());
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
