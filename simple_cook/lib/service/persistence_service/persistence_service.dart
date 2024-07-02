import 'package:hive/hive.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/common/theme.dart';
import 'dart:math';

class PersistenceService {
  static final PersistenceService _instance = PersistenceService._internal();

  factory PersistenceService() {
    return _instance;
  }

  PersistenceService._internal();

  late Box<SingleRecipe> _favoritesBox;
  late Box<List<dynamic>> _plannerBox;
  late Box<Recipe> _recipeOfTheDayBox;
  late Box<DateTime> _recipeOfTheDayDateBox;
  late Box<List<String>> _searchBarIngredientBox;

  Future<void> init() async {
    try {
      // Open the box for 'favoritesBox'
      //print("Looks like it worked");
      _favoritesBox = await Hive.openBox<SingleRecipe>('favoritesBox');
      _plannerBox = await Hive.openBox<List>('plannerBox');
      _recipeOfTheDayBox = await Hive.openBox<Recipe>('recipeOfTheDayBox');
      _recipeOfTheDayDateBox =
          await Hive.openBox<DateTime>('recipeOfTheDayDateBox');
      _searchBarIngredientBox =
          await Hive.openBox<List<String>>('searchBarIngredientBox');
      if (_searchBarIngredientBox.isEmpty) {
        await _searchBarIngredientBox.put(0, SimpleCookIngredientList.kOptions);
      }
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
    return _plannerBox.toMap().map(
        (key, value) => MapEntry(key as String, value.cast<SingleRecipe>()));
  }

  Future<void> clearPlanner() async {
    await _plannerBox.clear();
  }

  Future<void> addRecipeToPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes =
        _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.add(recipe);
    await _plannerBox.put(date, recipes);
  }

  // Method to get recipes for a specific date from planner
  List<SingleRecipe> getRecipesForDate(String date) {
    return _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ??
        []; // Handle potential null by providing default empty list
  }

  Future<void> removeRecipeFromPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes =
        _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.removeWhere(
        (SingleRecipe r) => r.title == recipe.title); // Remove based on title
    await _plannerBox.put(date, recipes);
  }

  bool isRecipeOfTheDayBoxEmpty() {
    return _recipeOfTheDayBox.isEmpty;
  }

  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay) async {
    await _recipeOfTheDayBox.put(0, newRecipeOfTheDay);
  }

  Future<void> putRecipeOfTheDayDate(DateTime today) async {
    await _recipeOfTheDayDateBox.put(0, today);
  }

  Future<Recipe> getRecipeOfTheDay(RecipeService recipeService) async {
    DateTime today = DateTime.now();
    DateTime? lastRecipeDate = _recipeOfTheDayDateBox.get(0);

    // Check if today's recipe is already set
    if (lastRecipeDate != null &&
        lastRecipeDate.year == today.year &&
        lastRecipeDate.month == today.month &&
        lastRecipeDate.day == today.day) {
      return _recipeOfTheDayBox.get(0)!;
    } else {
      List<Recipe> recipes =
          (await recipeService.getAllRecipes('Hauptspeise')).data!;
      final Random random = Random();
      Recipe newRecipeOfTheDay;

      do {
        newRecipeOfTheDay = recipes[random.nextInt(recipes.length)];
      } while (_recipeOfTheDayBox.isNotEmpty &&
          newRecipeOfTheDay == _recipeOfTheDayBox.get(0));

      // Update the recipe of the day and date
      _recipeOfTheDayBox.put(0, newRecipeOfTheDay);
      _recipeOfTheDayDateBox.put(0, today);

      return newRecipeOfTheDay;
    }
  }

  Future<void> addToSearchBox(String searchTerm) async {
    final List<String>? currentHistory = _searchBarIngredientBox.get(0, defaultValue: []);
    final updatedHistory = [...?currentHistory, searchTerm];
    await _searchBarIngredientBox.put(0, updatedHistory);
  }

  List<String> getSearchBox() {
    final List<String>? history = _searchBarIngredientBox.get(0, defaultValue: []);
    return history ?? []; // Return an empty list if history is null
  }

  Future<Iterable<String>> search(String query) async {
    if (query.isEmpty) {
      return Iterable<String>.empty();
    }
    final List<String> ingredients = _searchBarIngredientBox.get(0) ?? [];
    return ingredients.where((String option) => option.contains(query));
  }

}
