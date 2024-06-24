import 'package:simple_cook/service/recipe_client.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class RecipeService {
  final api = RecipeClient();

  Future<List<Recipe>?> getAllRecipes(String text, {String? time, String? diet}) async {
    return api.getRecipes(text, time, diet);
  }

  Future<SingleRecipe?> getSingleRecipe(String recipeUrl) async {
    return api.getSingleRecipe(recipeUrl);
  }
}