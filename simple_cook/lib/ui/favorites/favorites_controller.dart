import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_controllerInterface.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

class FavoritesViewController extends StateNotifier<List<Recipe>> implements FavoritesViewControllerInterface {
  FavoritesViewController() : super([]);

  @override
  List<Recipe> get favoriteRecipes => state;

  @override
  void addRecipe(Recipe recipe) {
    state = [...state, recipe];
  }

  @override
  void removeRecipe(Recipe recipe) {
    state = state.where((r) => r != recipe).toList();
  }
    void addMockRecipe() {
    addRecipe(Recipe('assets/flammkuchen.jpg', 'Flammkuchen'));
  }

}

final favoritesViewControllerProvider = StateNotifierProvider<FavoritesViewController, List<Recipe>>(
  (ref) => FavoritesViewController(),
);