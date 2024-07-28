import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/favorites/services/favorites_persistence_service.dart';

part 'favorites_controller_implementation.g.dart';

@riverpod
class FavoritesControllerImplementation extends _$FavoritesControllerImplementation
    implements FavoritesController {
  @override
  FavoritesModel build({
    required final FavoritesPersistenceService persistenceService,
  }) => const FavoritesModel();

  @override
  Future<void> loadFavorites() async {
    final favorites = persistenceService.getFavoriteRecipes();
    state = state.copyWith(
      favoriteRecipes: favorites
    );
  }

  Future<void> _addFavorite(SingleRecipe recipe) async {
    await persistenceService.addFavorite(recipe);
  }

  Future<void> _removeFavorite(SingleRecipe recipe) async {
    await persistenceService.removeFavorite(recipe);
  }

  @override
  bool isFavorite(SingleRecipe recipe) {
    return persistenceService.isFavorite(recipe);
  }

  @override
  Future<void> toggleFavorite(SingleRecipe recipe) async {
    if (isFavorite(recipe)) {
      await _removeFavorite(recipe);
    } else {
      await _addFavorite(recipe);
    }
    loadFavorites();
  }

}