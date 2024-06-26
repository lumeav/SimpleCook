import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipefinder/recipefinder_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/persistence_service.dart';
import 'package:simple_cook/service/persistence_service_model.dart';
import 'go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

// To test:
import 'package:simple_cook/ui/recipe/recipe_view.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';

//This is the "main.dart" file, currently named "mein.dart" to test dummy data

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,   // Set the orientation of our App to portrait mode
  ]);
  await initializeDateFormatting('de_DE', null);

  //Dont run this code at the moment, it is very buggy and may mess up your emulator

  //Initialize Hive
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(SingleRecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());

  // Initialize PersistenceService
  //await PersistenceService().clearFavorites();
  final persistenceService = PersistenceService();
  await persistenceService.init();

  //await persistenceService.clearFavorites();
  
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

  // This widget is the root of your application.

