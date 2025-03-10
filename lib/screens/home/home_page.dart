import 'package:flutter/material.dart';
import '../maps/maps_page.dart';
import '../appointments/appointments_page.dart';
import '../chat/contacts_list_page.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const MapsPage(),
    const AppointmentsPage(),
    ContactsList(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context
  ) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      

      /*
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'GO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'PLAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            activeIcon: Icon(Icons.chat, color: Colors.blue),
            label: 'CHAT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings, color: Colors.blue),
            label: 'Settings',
          ),

        ],
      ),

      */

                    bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map), // Icon for "GO"
                    label: 'Go',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today), // Icon for "PLAN"
                    label: 'Plan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline), // Icon for "CHAT"
                    activeIcon: Icon(Icons.chat_bubble, color: Colors.blue), // Active icon for "CHAT"
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), // Icon for "Profile"
                    activeIcon: Icon(Icons.person, color: Colors.blue), // Active icon for "Profile"
                    label: 'Profile',
                  ),
                ],
              ),
    );
  }
} 