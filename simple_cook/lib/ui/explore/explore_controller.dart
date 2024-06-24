import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

class ExploreController {
  final RecipeService _recipeService = RecipeService();

  Future<List<Recipe>?> getRecipes(String text, String? time, String? diet) async {
    final respone = await _recipeService.getAllRecipes(text);


  }


}