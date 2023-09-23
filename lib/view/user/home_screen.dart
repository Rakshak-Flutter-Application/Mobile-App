import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/view/user/dashboard.dart';


class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screenOptions = <Widget>[
    const UserDashBoardScreen(),
    const UserDashBoardScreen(),
    const UserDashBoardScreen(),
    const UserDashBoardScreen(),
    const UserDashBoardScreen(),
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
          //home
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
              ),
              label: 'Home'),

          //map
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_sharp,
                size: 40,
              ),
              label: 'Maps'),

          //contacts
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 40,
              ),
              label: 'Profile'),
              //events
               BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
                size: 40,
              ),
              label: 'Events'),

          //settings
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),

    );
  }
}
