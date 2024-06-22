import 'package:simple_cook/service/recipe_api.dart';
import 'package:simple_cook/service/recipe_model.dart';

class RecipeService {
  final api = RecipeApi();

  Future<List<Recipe>?> getAllRecipes(String? text, String? time, String? diet) async {
    return api.getRecipes(text, time, diet);
  }
}