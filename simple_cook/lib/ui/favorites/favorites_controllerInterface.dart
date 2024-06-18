import 'package:simple_cook/ui/favorites/favorites_model.dart';

abstract class FavoritesControllerInterface {
  List<Recipe> get favoriteRecipes;
  void addRecipe(Recipe recipe);
  void removeRecipe(Recipe recipe);
  void addMockRecipe();
}