import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeOfTheDayNotifier extends StateNotifier<Recipe?> {
  RecipeOfTheDayNotifier() : super(null) {
    _checkAndLoadRecipeOfTheDay();
  }

  final PersistenceService _persistenceService = PersistenceService();
  final RecipeService _recipeService = RecipeService();

  Future<void> _checkAndLoadRecipeOfTheDay() async {
    if (!isRecipeOfTheDayBoxEmpty()) {
      await _loadRecipeOfTheDay();
    }
  }

  Future<void> _loadRecipeOfTheDay() async {
    final recipe = await _persistenceService.getRecipeOfTheDay(_recipeService);
    state = recipe;
  }
  bool isRecipeOfTheDayBoxEmpty() {
    return _persistenceService.isRecipeOfTheDayBoxEmpty();
  }
  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay) async {
    await _persistenceService.putRecipeOfTheDay(newRecipeOfTheDay);
    state = newRecipeOfTheDay;
  }

  Future<void> putRecipeOfTheDayDate(DateTime today) async {
    await _persistenceService.putRecipeOfTheDayDate(today);
    // Optionally update state or handle as needed
  }
}

final recipeOfTheDayProvider = StateNotifierProvider<RecipeOfTheDayNotifier, Recipe?>((ref) {
  return RecipeOfTheDayNotifier();
});