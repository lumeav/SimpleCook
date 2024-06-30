import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
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

  //Future<void> resetState() async {
  //  state = const ResultModel();
  //}

  @override
  Future<void> refetchRecipe(String query) async {
    state = const ResultModel();
    await fetchRecipe(query);
  }

  @override
  Future<void> fetchRecipe(String query) async {
    try {
      //await _resetState();
      final RecipeService service = RecipeService();
      final ApiResponse<GenRecipeModel> response =
          await service.postGenRecipeModel(query);
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
      print(e);
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  Future<void> _fetchRecipeImg(GenRecipeModel genRecipe) async {
    try {
      final RecipeService service = RecipeService();
      ApiResponse<String> response =
          await service.postGenRecipeModelImg(genRecipe);
      if (response.data != null) {
        state = state.copyWith(
            url: response.data, error: false, fetchFinished: true);
      } else {
        state = state.copyWith(
          error: true,
          errorMessage: response.errorMessage,
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
