import 'package:hive/hive.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

class PersistenceService {
  static final PersistenceService _instance = PersistenceService._internal();

  factory PersistenceService() {
    return _instance;
  }

  PersistenceService._internal();

  late Box<SingleRecipe> _favoritesBox;
  late Box<List<dynamic>> _plannerBox;

  Future<void> init() async {
    try {
      // Open the box for 'favoritesBox'
      //print("Looks like it worked");
      _favoritesBox = await Hive.openBox<SingleRecipe>('favoritesBox');
      _plannerBox = await Hive.openBox<List>('plannerBox');
    } catch (e) {
      print('Error initializing Hive box: $e');
      // Handle initialization error gracefully
      rethrow; // Re-throw the exception to propagate it further
    }
  }

  Future<void> clearFavorites() async {
  await _favoritesBox.clear();
}

  List<SingleRecipe> getFavoriteRecipes() {
    return _favoritesBox.values.toList();
  }

  bool isFavorite(SingleRecipe recipe) {
    return _favoritesBox.containsKey(recipe.title);
  }

  Future<void> addFavorite(SingleRecipe recipe) async {
    await _favoritesBox.put(recipe.title, recipe);
  }

  Future<void> removeFavorite(SingleRecipe recipe) async {
    await _favoritesBox.delete(recipe.title);
  }

  Map<String, List<SingleRecipe>> loadPlanner() {
    return _plannerBox.toMap().map((key, value) => MapEntry(key as String, value.cast<SingleRecipe>()));
  }

  Future<void> clearPlanner() async {
    await _plannerBox.clear();
  }

  Future<void> addRecipeToPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes = _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.add(recipe);
    await _plannerBox.put(date, recipes);
  }

  // Method to get recipes for a specific date from planner
  List<SingleRecipe> getRecipesForDate(String date) {
    return _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? []; // Handle potential null by providing default empty list
  }

  Future<void> removeRecipeFromPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes = _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.removeWhere((SingleRecipe r) => r.title == recipe.title); // Remove based on title
    await _plannerBox.put(date, recipes);
  }
}