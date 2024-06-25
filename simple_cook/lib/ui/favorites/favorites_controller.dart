import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/ui/favorites/services/favorites_persistence_service.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesControllerImplementation extends _$FavoritesControllerImplementation implements FavoritesController {

  @override
  FavoritesModel build({
    required final FavoritesPersistenceService persistenceService,
  }) {
    // ToDo: Load favorite recipes from Persistence-Service database
    return FavoritesModel(recipes: []);
  }

  @override
  void addRecipe(Recipe recipe) {
    state = state.copyWith(recipes: [...state.recipes, recipe]);
  }

  @override
  void removeRecipe(Recipe recipe) {
    state = state.copyWith(recipes: state.recipes.where((r) => r != recipe).toList());
  }

  @override
  void showRecipe() {
    // TODO: implement showRecipe
  }
}