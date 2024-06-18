import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipefinder/recipefinder_view.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/ui/recipesTag/recipesTag_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//This is the "main.dart" file, currently named "mein.dart" to test dummy data

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('de_DE', null);
    runApp(ProviderScope(child: MyApp()));
  }

    // This widget is the root of your application.
  class MyApp extends StatelessWidget {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => ExploreView(
            selectedIndex: 0,
            onItemTapped: (index) => _onItemTapped(index, context),
          ),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => RecipefinderView(
            selectedIndex: 1,
            onItemTapped: (index) => _onItemTapped(index, context),
          ),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesView(
            selectedIndex: 2,
            onItemTapped: (index) => _onItemTapped(index, context),
          ),
        ),
        GoRoute(
          path: '/planner',
          builder: (context, state) => PlannerView(
            selectedIndex: 3,
            onItemTapped: (index) => _onItemTapped(index, context),
          ),
        ),
        GoRoute(
          path: '/recipeFinder',
          builder: (context, state) => RecipesTagView(
            //new page for search recipe result not complete!!
            selectedIndex: 1,
            onItemTapped: (index) => _onItemTapped(index, context),

          ),
        )
      ],
    );

    @override
    Widget build(BuildContext context) {
      return MaterialApp.router(
        title: 'SimpleCook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router,
      );
    }


    static void _onItemTapped(int index, BuildContext context) {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/search');
          break;
        case 2:
          context.go('/favorites');
          break;
        case 3:
          context.go('/planner');
          break;
      }
    }
  }