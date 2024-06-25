import 'package:flutter/material.dart';
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
import 'package:path_provider/path_provider.dart' as path_provider;

// To test:
import 'package:simple_cook/ui/recipe/recipe_view.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';

//This is the "main.dart" file, currently named "mein.dart" to test dummy data

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('de_DE', null);

  /* Dont run this code at the moment, it is very buggy and may mess up your emulator
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Initialize Hive and register adapters
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(SingleRecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(NutritionAdapter());

  // Initialize PersistenceService
  final persistenceService = PersistenceService();
  await persistenceService.init();

  //await persistenceService.clearFavorites();
  */
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

