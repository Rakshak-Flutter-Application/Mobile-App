import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/view/agency/dashboard.dart';
import 'package:rakshak_sos/view/agency/events/event_list_screen.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screenOptions = <Widget>[
    const AgencyDashBoardScreen(),
    const Placeholder(),
    const Placeholder(),
    const AgencyEventScren(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.buttonColor,
        unselectedItemColor: AppColors.bottomNavColor,
        elevation: 10,
        items: <BottomNavigationBarItem>[
          // Home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: 'Home',
          ),

          // Maps
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_sharp,
              size: 40,
            ),
            label: 'Maps',
          ),

          // Profile
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 40,
            ),
            label: 'Profile',
          ),

          // Events
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 40,
            ),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
