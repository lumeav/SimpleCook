import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_model.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_view.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';


part 'result_controller_implementation.g.dart';

@riverpod
class ResultControllerImplementation extends _$ResultControllerImplementation
  implements ResultController {

  @override
  ResultModel build() => const ResultModel();

  @override
  void fetchRecipe(String query) async {
    final RecipeService service = RecipeService();

    try {
      final GenRecipeModel fetchedRecipe = await service.postGenRecipeModel(query);
      state = state.copyWith(
        recipe: fetchedRecipe,
        error: false
      );
      _fetchRecipeImg(fetchedRecipe);
    } catch (e) {
      state = state.copyWith(
        error: true,
      );
    }
  }

   void _fetchRecipeImg(GenRecipeModel genRecipe) async {
    final RecipeService service = RecipeService();

    try {
      final String fetchedUrl = await service.postGenRecipeModelImg(genRecipe);
      state = state.copyWith(
        url: fetchedUrl,
        error: false,
        isLoadRecipe: true
      );
    } catch (e) {
      state = state.copyWith(
        error: true,
      );
    }
  }

}