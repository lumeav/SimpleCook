import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';

abstract class RecipeInfoRecipeService {
  Future<ApiResponse<SingleRecipe>> getSingleRecipe(String recipeUrl);
  Future<ApiResponse<String>> postGenRecipeModelImg(GenRecipeModel genRecipe);
  Future<ApiResponse<GenRecipeModel>> postGenRecipeModel(String request);
}