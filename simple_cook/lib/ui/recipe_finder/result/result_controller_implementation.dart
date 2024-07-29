import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_model.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_view.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/ui/recipe_finder/services/result_recipe_service.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

part 'result_controller_implementation.g.dart';

@riverpod
class ResultControllerImplementation extends _$ResultControllerImplementation
    implements ResultController {

  @override
  ResultModel build({
    required final ResultRecipeService recipeService,
  }) => const ResultModel();

  @override
  Future<void> refetchRecipe(String query) async {
    state = const ResultModel();
    await fetchRecipe(query);
  }

  @override
  Future<void> fetchRecipe(String query) async {
    try {
      final ApiResponse<GenRecipeModel> response =
          await recipeService.postGenRecipeModel(query);
      if (response.data == null && response.errorMessage != null) {
        state = state.copyWith(
          error: true,
          errorMessage: response.errorMessage,
        );
      } else if (response.data != null &&
          response.errorMessage == null) {
        state = state.copyWith(recipe: response.data, error: false);
        await _fetchRecipeImg(response.data!);
      }
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  Future<void> _fetchRecipeImg(GenRecipeModel genRecipe) async {
    try {
      ApiResponse<String> response =
          await recipeService.postGenRecipeModelImg(genRecipe);
      if (response.data != null) {
        mapSingleRecipe(genRecipe, response.data!);
        state = state.copyWith(
            url: response.data, error: false, fetchFinished: true);
      } else {
        print("Fehler!!!");
        state = state.copyWith(
          error: true,
          errorMessage: response.errorMessage,
        );
      }
    } catch (e, s) {
      print("Fehler!!!123");
      print(e);
      print(s);
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  void mapSingleRecipe(GenRecipeModel recipe, String url) {
      var genRecipeJson = recipe.toJson();
      var singleRecipe = SingleRecipe.genRecipeFromJson(genRecipeJson);
      singleRecipe.imageUrls = [url]; // Change the assignment to a list containing the url
      print(singleRecipe.toString());
      state = state.copyWith(singleRecipe: singleRecipe);
  }
}
