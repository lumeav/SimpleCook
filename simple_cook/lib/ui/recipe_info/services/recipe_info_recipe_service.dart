import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

abstract class RecipeInfoRecipeService {
  Future<ApiResponse<SingleRecipe>> getSingleRecipe(String recipeUrl);
}