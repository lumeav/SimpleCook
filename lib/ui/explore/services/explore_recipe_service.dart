import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';

abstract class ExploreRecipeService {
  Future<ApiResponse<List<Recipe>?>> getAllRecipes(String text);
}