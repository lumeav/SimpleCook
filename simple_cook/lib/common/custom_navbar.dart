import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;

  const CustomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Set background color
      selectedItemColor: Colors.orange, // Set selected item color
      unselectedItemColor: Colors.grey, // Set unselected item color
      currentIndex: child.currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed, // Disable shifting effect
      items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Planner',
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    child.goBranch(index);
  }
}