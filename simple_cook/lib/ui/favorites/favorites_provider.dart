import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/ui/favorites/persistence_service/persistence_service_interface.dart';

class FavoritesNotifier extends StateNotifier<List<SingleRecipe>> {
  
  final IFavoritesService _favoritesService;

  FavoritesNotifier(this._favoritesService) : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favorites = _favoritesService.getFavoriteRecipes();
    state = favorites;
  }

  Future<void> addFavorite(SingleRecipe recipe) async {
    await _favoritesService.addFavorite(recipe);
    state = await _favoritesService.getFavoriteRecipes();
  }

  Future<void> removeFavorite(SingleRecipe recipe) async {
    await _favoritesService.removeFavorite(recipe);
    state = await _favoritesService.getFavoriteRecipes();
  }

  bool isFavorite(SingleRecipe recipe) {
    return _favoritesService.isFavorite(recipe);
  }

  Future<void> toggleFavorite(SingleRecipe recipe) async {
    if (isFavorite(recipe)) {
      await removeFavorite(recipe);
    } else {
      await addFavorite(recipe);
    }
    state = await _favoritesService.getFavoriteRecipes(); // Update state after toggling
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<SingleRecipe>>((ref) {
  final IFavoritesService favoritesService = PersistenceService();
  return FavoritesNotifier(favoritesService);
});