import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/ui/explore/services/explore_recipe_service.dart';


abstract class ExplorePersistenceService {
  bool isRecipeOfTheDayBoxEmpty();
  Future<void> putRecipeOfTheDay(Recipe newRecipeOfTheDay);
  Future<void> putRecipeOfTheDayDate(DateTime today);
  Future<Recipe> getRecipeOfTheDay(ExploreRecipeService recipeService);
}