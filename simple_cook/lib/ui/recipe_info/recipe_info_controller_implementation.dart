import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_model.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_view.dart';
import 'package:simple_cook/ui/recipe_info/services/recipe_info_recipe_service.dart';

part 'recipe_info_controller_implementation.g.dart';

@riverpod
class RecipeInfoControllerImplementation
    extends _$RecipeInfoControllerImplementation
    implements RecipeInfoController {

  @override
  RecipeInfoModel build({required final RecipeInfoRecipeService recipeService}) => const RecipeInfoModel();

  @override
  Future<void> refetchRecipe(String? recipeUrl) async {
    state = const RecipeInfoModel();
    await fetchRecipe(recipeUrl);
  }

  @override
  Future<void> fetchRecipe(String? recipeUrl) async {
    try {
      ApiResponse<SingleRecipe> response =
          await recipeService.getSingleRecipe(recipeUrl!);
      if (response.data == null && response.errorMessage != null) {
        state =
            state.copyWith(error: true, errorMessage: response.errorMessage);
      } else if (response.data != null && response.errorMessage == null) {
        state = state.copyWith(
          recipe: response.data,
          fetchFinished: true
        );
      }
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }
}
