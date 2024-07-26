import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'dart:math';

import 'package:simple_cook/ui/explore/services/explore_persistence_service.dart';
import 'package:simple_cook/ui/explore/services/explore_recipe_service.dart';

part 'explore_controller_implementation.g.dart';

@riverpod
class ExploreControllerImplementation extends _$ExploreControllerImplementation
    implements ExploreController {
  @override
  ExploreModel build({
    required final ExplorePersistenceService persistenceService,
    required final ExploreRecipeService recipeService,
  }) => const ExploreModel();

  @override
  Future<void> rebuildRecipes() async {
    state = const ExploreModel();
    await buildRecipes();
  }

  @override
  Future<void> buildRecipes() async {
    try {
      final bool isBoxEmpty =
          persistenceService.isRecipeOfTheDayBoxEmpty();
      ApiResponse<List<Recipe>?> response =
          await recipeService.getAllRecipes('Hauptspeise');
      if (response.data != null && response.errorMessage == null) {
        List<Recipe> recipes = response.data!;
        if (isBoxEmpty) {
          final Random random = Random();
          Recipe recipeOfTheDay = recipes[random.nextInt(recipes.length)];
          persistenceService.putRecipeOfTheDay(recipeOfTheDay);
          persistenceService.putRecipeOfTheDayDate(DateTime.now());
          recipes.remove(recipeOfTheDay);
          state = state.copyWith(
            recipes: recipes,
            recipeOfTheDay: recipeOfTheDay,
            fetchFinished: true,
          );
        } else {
          final Recipe recipeOfTheDay = await persistenceService.getRecipeOfTheDay(recipeService);
          recipes.remove(recipeOfTheDay);
          state = state.copyWith(
            recipes: recipes,
            recipeOfTheDay: recipeOfTheDay,
            fetchFinished: true,
          );
        }
      } else if (response.data == null && response.errorMessage != null) {
        state =
            state.copyWith(error: true, errorMessage: response.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

}
