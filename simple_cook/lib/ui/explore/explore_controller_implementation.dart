import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/explore/explore_provider.dart';
import 'dart:math';

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
      final bool isBoxEmpty =
          ref.read(recipeOfTheDayProvider.notifier).isRecipeOfTheDayBoxEmpty();
      final RecipeService recipeService = RecipeService();
      ApiResponse<List<Recipe>?> response =
          await recipeService.getAllRecipes('Hauptspeise');
      if (response.data != null && response.errorMessage == null) {
        List<Recipe> recipes = response.data!;
        if (isBoxEmpty) {
          final Random random = Random();
          Recipe recipeOfTheDay = recipes[random.nextInt(recipes.length)];
          ref.read(recipeOfTheDayProvider.notifier).putRecipeOfTheDay(recipeOfTheDay);
          ref.read(recipeOfTheDayProvider.notifier).putRecipeOfTheDayDate(DateTime.now());
          recipes.remove(recipeOfTheDay);
          state = state.copyWith(
            recipes: recipes,
            recipeOfTheDay: recipeOfTheDay,
            fetchFinished: true,
          );
        } else {
          final Recipe? recipeOfTheDay = await ref.read(recipeOfTheDayProvider);
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
