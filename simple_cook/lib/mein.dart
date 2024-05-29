import 'package:flutter/material.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipefinder/recipefinder_view.dart';

//This is the "main.dart" file, currently named "mein.dart" to test dummy data

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleCook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ExploreView(
          selectedIndex: 0,
          onItemTapped: (index) => _onItemTapped(index, context),
            // Handle navigation or state change when an item is tapped
          ),
        '/search': (context) => RecipefinderView(
          selectedIndex: 1,
          onItemTapped: (index) => _onItemTapped(index, context),
            // Handle navigation or state change when an item is tapped
          ),
        '/favorites': (context) => FavoritesView(
          selectedIndex: 2,
          onItemTapped: (index) => _onItemTapped(index, context),
            // Handle navigation or state change when an item is tapped,
          ),
        '/planner': (context) => PlannerView(
          selectedIndex: 3,
          onItemTapped: (index) => _onItemTapped(index, context),
            // Handle navigation or state change when an item is tapped
        ),
      },
    );
  }

  static void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/search');
        break;
      case 2:
        Navigator.pushNamed(context, '/favorites');
        break;
      case 3:
        Navigator.pushNamed(context, '/planner');
        break;
    }
  }
}

