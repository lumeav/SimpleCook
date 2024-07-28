import 'package:hive/hive.dart';
import 'package:simple_cook/service/persistence_service/persistence_service_aggregator.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/common/theme.dart';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/explore/services/explore_recipe_service.dart';

part 'persistence_service.g.dart';

@Riverpod(keepAlive: true)
PersistenceServiceAggregator persistenceService(
  final PersistenceServiceRef ref,
) => PersistenceService();

class PersistenceService extends PersistenceServiceAggregator {
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
      _favoritesBox = await Hive.openBox<SingleRecipe>('favoritesBox');
      _plannerBox = await Hive.openBox<List>('plannerBox');
      _recipeOfTheDayBox = await Hive.openBox<Recipe>('recipeOfTheDayBox');
      _recipeOfTheDayDateBox =
          await Hive.openBox<DateTime>('recipeOfTheDayDateBox');
      _searchBarIngredientBox =
          await Hive.openBox<List<String>>('searchBarIngredientBox');
      final storedIngredients = _searchBarIngredientBox.get(0);
      if (storedIngredients == null ||
          storedIngredients.length !=
              SimpleCookIngredientList.kOptions.length) {
        await _searchBarIngredientBox.put(0, SimpleCookIngredientList.kOptions);
      }
    } catch (e) {
      print('Error initializing Hive box: $e');
      rethrow;
    }
  }

  @override
  Future<void> clearFavorites() async {
    await _favoritesBox.clear();
  }

  @override
  List<SingleRecipe> getFavoriteRecipes() {
    return _favoritesBox.values.toList();
  }

  @override
  bool isFavorite(SingleRecipe recipe) {
    return _favoritesBox.containsKey(recipe.title);
  }

  @override
  Future<void> addFavorite(SingleRecipe recipe) async {
    await _favoritesBox.put(recipe.title, recipe);
  }

  @override
  Future<void> removeFavorite(SingleRecipe recipe) async {
    await _favoritesBox.delete(recipe.title);
  }

  @override
  Map<String, List<SingleRecipe>> loadPlanner() {
    return _plannerBox.toMap().map(
        (key, value) => MapEntry(key as String, value.cast<SingleRecipe>()));
  }

  @override
  Future<void> addRecipeToPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes =
        _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.add(recipe);
    await _plannerBox.put(date, recipes);
  }

  @override
  List<SingleRecipe> getRecipesForDate(String date) {
    return _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ??
        [];
  }

  @override
  Future<void> removeRecipeFromPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes =
        _plannerBox.get(date, defaultValue: [])?.cast<SingleRecipe>() ?? [];
    recipes.removeWhere(
        (SingleRecipe r) => r.title == recipe.title);
    await _plannerBox.put(date, recipes);
  }

  @override
  bool isRecipeOfTheDayBoxEmpty() {
    return _recipeOfTheDayBox.isEmpty;
  }

  @override
  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay) async {
    await _recipeOfTheDayBox.put(0, newRecipeOfTheDay);
  }

  @override
  Future<void> putRecipeOfTheDayDate(DateTime today) async {
    await _recipeOfTheDayDateBox.put(0, today);
  }

  @override
  Future<Recipe> getRecipeOfTheDay(ExploreRecipeService recipeService) async {
    DateTime today = DateTime.now();
    DateTime? lastRecipeDate = _recipeOfTheDayDateBox.get(0);

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

      _recipeOfTheDayBox.put(0, newRecipeOfTheDay);
      _recipeOfTheDayDateBox.put(0, today);

      return newRecipeOfTheDay;
    }
  }

  @override
  Future<void> addToSearchBox(String searchTerm) async {
    final List<String>? currentHistory =
        _searchBarIngredientBox.get(0, defaultValue: []);
    final updatedHistory = [...?currentHistory, searchTerm];
    await _searchBarIngredientBox.put(0, updatedHistory);
  }

  @override
  List<String> getSearchBox() {
    final List<String>? history =
        _searchBarIngredientBox.get(0, defaultValue: []);
    return history ?? [];
  }

  @override
  Future<Iterable<String>> search(String query) async {
    if (query.isEmpty) {
      return Iterable<String>.empty();
    }
    final List<String> ingredients = _searchBarIngredientBox.get(0) ?? [];
    final lowerCaseQuery = query.toLowerCase();
    return ingredients.where((String option) => option.toLowerCase().contains(lowerCaseQuery));
  }
}