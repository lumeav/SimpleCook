import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';

class PlannerNotifier extends StateNotifier<Map<String, List<SingleRecipe>>> {
  PlannerNotifier() : super({}) {
    loadPlanner();
  }

  final PersistenceService _persistenceService = PersistenceService();

  Future<void> loadPlanner() async {
    final plannerRecipes = _persistenceService.loadPlanner();
    state = plannerRecipes;
  }

  Future<void> addPlanner(String date, SingleRecipe recipe) async {
    await _persistenceService.addRecipeToPlanner(date, recipe);
    state = await _persistenceService.loadPlanner();
  }

  Future<void> removePlanner(String date, SingleRecipe recipe) async {
    await _persistenceService.removeRecipeFromPlanner(date, recipe);
    state = await _persistenceService.loadPlanner();
  }

  List<SingleRecipe> getRecipesForDate(String date) {
    var test = _persistenceService.getRecipesForDate(date);
    return test;
  }
}

final plannerProvider =
    StateNotifierProvider<PlannerNotifier, Map<String, List<SingleRecipe>>>((ref) {
  return PlannerNotifier();
});
