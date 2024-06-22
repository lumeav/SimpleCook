import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_controller_interface.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

class FavoritesController extends StateNotifier<List<Recipe>> implements FavoritesControllerInterface {
  FavoritesController() : super([]);

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
    addRecipe(Recipe('assets/flammkuchen.jpg', 'Flammkuchen long text xxxxxxx'));
  }

  void removeMockRecipe() {
    removeRecipe(Recipe('assets/flammkuchen.jpg', 'Flammkuchen long text xxxxxxx'));
  }

}

final favoritesControllerProvider = StateNotifierProvider<FavoritesController, List<Recipe>>(
  (ref) => FavoritesController(),
);