import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';

abstract class IFavoritesService {
  Future<void> clearFavorites();
  List<SingleRecipe> getFavoriteRecipes();
  bool isFavorite(SingleRecipe recipe);
  Future<void> addFavorite(SingleRecipe recipe);
  Future<void> removeFavorite(SingleRecipe recipe);
}