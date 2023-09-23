import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({super.key});

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screenOptions = <Widget>[
    const AgencyHomeScreen(),
    const AgencyHomeScreen(),
    const AgencyHomeScreen(),
    const AgencyHomeScreen(),
    const AgencyHomeScreen(),
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

          //settings
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
