import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_client.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

class RecipeService {
  final RecipeClient api = RecipeClient();

  Future<ApiResponse<List<Recipe>?>> getAllRecipes(String text) async {
    return api.getRecipes(text);
  }

  Future<ApiResponse<SingleRecipe>> getSingleRecipe(String recipeUrl) async {
    return api.getSingleRecipe(recipeUrl);
  }

  Future<ApiResponse<GenRecipeModel>> postGenRecipeModel(String request) async {
    return api.postGenRecipeModel(request);
  }

  Future<ApiResponse<String>> postGenRecipeModelImg(GenRecipeModel recipe) async {
    return api.postGenRecipeModelImg(recipe);
  }
}