import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;

  const CustomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: child.currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
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