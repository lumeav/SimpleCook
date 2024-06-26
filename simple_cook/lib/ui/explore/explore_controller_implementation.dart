import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';

part 'explore_controller_implementation.g.dart';

@riverpod
class ExploreControllerImplementation extends _$ExploreControllerImplementation
    implements ExploreController {
  @override
  ExploreModel build() => const ExploreModel();

  Future<void> buildRecipes() async {
    try {
      final recipeService = RecipeService();
      List<Recipe>? recipes = await recipeService.getAllRecipes('Hauptspeise');
      var random = Random();
      Recipe recipeOfTheDay = recipes![random.nextInt(recipes.length)];
      recipes.remove(recipeOfTheDay);

      state = state.copyWith(
        recipes: recipes,
        recipeOfTheDay: recipeOfTheDay,
        isSearching: true,
      );
    } catch (e) {
      state = state.copyWith(error: true);
    }
  }

  String checkDiff(String? diff) {
    if (diff == 'easy') {
      return 'einfach';
    } else if (diff == 'medium') {
      return 'mittel';
    } else if (diff == 'hard') {
      return 'schwer';
    } else {
      return 'unbekannt';
    }
  }
}
