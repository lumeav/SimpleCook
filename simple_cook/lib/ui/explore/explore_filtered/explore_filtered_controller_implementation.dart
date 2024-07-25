import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_model.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_view.dart';

part 'explore_filtered_controller_implementation.g.dart';

@riverpod
class ExploreFilteredControllerImplementation extends _$ExploreFilteredControllerImplementation
    implements ExploreFilteredController {

  @override
  ExploreFilteredModel build() => const ExploreFilteredModel();

  @override
  Future<void> rebuildRecipes(String search) async {
    state = const ExploreFilteredModel();
    await buildRecipes(search);
  }

  @override
  Future<void> buildRecipes(String search) async {
    try {
      final RecipeService recipeService = RecipeService();
      ApiResponse<List<Recipe>?> response =
          await recipeService.getAllRecipes(search);
      if (response.data != null && response.errorMessage == null) {
        state = state.copyWith(
          filteredRecipes: response.data,
          fetchFinished: true,
        );
      } else if (response.data == null && response.errorMessage != null) {
        state = state.copyWith(error: true, errorMessage: response.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: true, errorMessage: "An unexpected error occured!",);
    }
  }

}
