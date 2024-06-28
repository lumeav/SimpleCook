import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';

class FavoritesNotifier extends StateNotifier<List<SingleRecipe>> {
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  final PersistenceService _persistenceService = PersistenceService();

  Future<void> _loadFavorites() async {
    final favorites = _persistenceService.getFavoriteRecipes();
    state = favorites;
  }

  Future<void> addFavorite(SingleRecipe recipe) async {
    await _persistenceService.addFavorite(recipe);
    state = await _persistenceService.getFavoriteRecipes();
  }

  Future<void> removeFavorite(SingleRecipe recipe) async {
    await _persistenceService.removeFavorite(recipe);
    state = await _persistenceService.getFavoriteRecipes();
  }

  bool isFavorite(SingleRecipe recipe) {
    return _persistenceService.isFavorite(recipe);
  }

  Future<void> toggleFavorite(SingleRecipe recipe) async {
    if (isFavorite(recipe)) {
      await removeFavorite(recipe);
    } else {
      await addFavorite(recipe);
    }
    state = await _persistenceService.getFavoriteRecipes(); // Update state after toggling
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<SingleRecipe>>((ref) {
  return FavoritesNotifier();
});