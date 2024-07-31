import 'package:simple_cook/ui/explore/services/explore_recipe_service.dart';
import 'package:simple_cook/ui/recipe_info/services/recipe_info_recipe_service.dart';

abstract class RecipeServiceAggregator implements ExploreRecipeService, RecipeInfoRecipeService {
  RecipeServiceAggregator();
}