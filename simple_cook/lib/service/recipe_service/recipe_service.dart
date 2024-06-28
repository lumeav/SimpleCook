import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_client.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

class RecipeService {
  final api = RecipeClient();

  Future<List<Recipe>?> getAllRecipes(String text) async {
    return api.getRecipes(text);
  }

  Future<SingleRecipe> getSingleRecipe(String recipeUrl) async {
    return api.getSingleRecipe(recipeUrl);
  }

  Future<GenRecipeModel> postGenRecipeModel(String request) async {
    return api.postGenRecipeModel(request);
  }

  Future<String> postGenRecipeModelImg(GenRecipeModel recipe) async {
    return api.postGenRecipeModelImg(recipe);
  }
}