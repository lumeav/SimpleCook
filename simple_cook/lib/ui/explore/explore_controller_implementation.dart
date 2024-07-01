import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';

part 'explore_controller_implementation.g.dart';

@riverpod
class ExploreControllerImplementation extends _$ExploreControllerImplementation
    implements ExploreController {
      
  @override
  ExploreModel build() => const ExploreModel();

  @override
  Future<void> rebuildRecipes() async {
    state = const ExploreModel();
    await buildRecipes();
  }

  @override
  Future<void> buildRecipes() async {
    try {
      final RecipeService recipeService = RecipeService();
      ApiResponse<List<Recipe>?> response =
          await recipeService.getAllRecipes('Hauptspeise');
      if (response.data != null && response.errorMessage == null) {
        List<Recipe> recipes = response.data!;
        final Random random = Random();
        Recipe recipeOfTheDay = recipes[random.nextInt(recipes.length)];
        recipes.remove(recipeOfTheDay);
        state = state.copyWith(
          recipes: recipes,
          recipeOfTheDay: recipeOfTheDay,
          fetchFinished: true,
        );
      } else if (response.data == null && response.errorMessage != null) {
        state = state.copyWith(error: true, errorMessage: response.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: true, errorMessage: "An unexpected error occured!",);
    }
  }

  @override
  String checkDiff(String? diff) {
    if (diff == 'easy') {
      return 'einfach';
    } else if (diff == 'medium') {
      return 'mittel';
    } else if (diff == 'hard') {
      return 'schwer';
    } else {
      return '';
    }
  }
}
