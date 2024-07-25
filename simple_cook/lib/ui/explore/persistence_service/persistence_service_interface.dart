import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';

abstract class IRecipeOfTheDayService {
  bool isRecipeOfTheDayBoxEmpty();
  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay);
  Future<void> putRecipeOfTheDayDate(DateTime today);
  Future<Recipe> getRecipeOfTheDay(RecipeService recipeService);
}