import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/explore/persistence_service/persistence_service_interface.dart';

class RecipeOfTheDayNotifier extends StateNotifier<Recipe?> {

  final IRecipeOfTheDayService _recipeOfTheDayService;

  RecipeOfTheDayNotifier(this._recipeOfTheDayService) : super(null) {
    _checkAndLoadRecipeOfTheDay();
  }

  final RecipeService _recipeService = RecipeService();

  Future<void> _checkAndLoadRecipeOfTheDay() async {
    if (!isRecipeOfTheDayBoxEmpty()) {
      await _loadRecipeOfTheDay();
    }
  }

  Future<void> _loadRecipeOfTheDay() async {
    final recipe = await _recipeOfTheDayService.getRecipeOfTheDay(_recipeService);
    state = recipe;
  }
  bool isRecipeOfTheDayBoxEmpty() {
    return _recipeOfTheDayService.isRecipeOfTheDayBoxEmpty();
  }
  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay) async {
    await _recipeOfTheDayService.putRecipeOfTheDay(newRecipeOfTheDay);
    state = newRecipeOfTheDay;
  }

  Future<void> putRecipeOfTheDayDate(DateTime today) async {
    await _recipeOfTheDayService.putRecipeOfTheDayDate(today);
  }
}

final recipeOfTheDayProvider = StateNotifierProvider<RecipeOfTheDayNotifier, Recipe?>((ref) {
  final IRecipeOfTheDayService recipeOfTheDayService = PersistenceService();
  return RecipeOfTheDayNotifier(recipeOfTheDayService);
});