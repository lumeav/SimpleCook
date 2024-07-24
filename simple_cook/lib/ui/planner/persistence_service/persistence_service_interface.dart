import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

abstract class IPlannerService {
  Map<String, List<SingleRecipe>> loadPlanner();
  Future<void> clearPlanner();
  Future<void> addRecipeToPlanner(String date, SingleRecipe recipe);
  List<SingleRecipe> getRecipesForDate(String date);
  Future<void> removeRecipeFromPlanner(String date, SingleRecipe recipe);
}