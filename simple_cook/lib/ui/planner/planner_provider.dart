import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/ui/planner/persistence_service/persistence_service_interface.dart';

class PlannerNotifier extends StateNotifier<Map<String, List<SingleRecipe>>> {

  final IPlannerService _plannerService;

  PlannerNotifier(this._plannerService) : super({}) {
    loadPlanner();
  }

  Future<void> loadPlanner() async {
    final plannerRecipes = _plannerService.loadPlanner();
    state = plannerRecipes;
  }

  Future<void> addPlanner(String date, SingleRecipe recipe) async {
    await _plannerService.addRecipeToPlanner(date, recipe);
    state = await _plannerService.loadPlanner();
  }

  Future<void> removePlanner(String date, SingleRecipe recipe) async {
    await _plannerService.removeRecipeFromPlanner(date, recipe);
    state = await _plannerService.loadPlanner();
  }

  List<SingleRecipe> getRecipesForDate(String date) {
    var test = _plannerService.getRecipesForDate(date);
    return test;
  }
}

final plannerProvider =
    StateNotifierProvider<PlannerNotifier, Map<String, List<SingleRecipe>>>((ref) {
  final IPlannerService plannerService = PersistenceService();
  return PlannerNotifier(plannerService);
});
