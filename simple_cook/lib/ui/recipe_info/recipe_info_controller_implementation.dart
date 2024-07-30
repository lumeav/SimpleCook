import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_model.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_view.dart';
import 'package:simple_cook/ui/recipe_info/services/recipe_info_recipe_service.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';

part 'recipe_info_controller_implementation.g.dart';

@riverpod
class RecipeInfoControllerImplementation
    extends _$RecipeInfoControllerImplementation
    implements RecipeInfoController {
  @override
  RecipeInfoModel build(
          {required final RecipeInfoRecipeService recipeService}) =>
      const RecipeInfoModel();

  @override
  Future<void> refetchRecipe(String? recipeUrl, String? genRecipeQuery) async {
    state = const RecipeInfoModel();
    if (genRecipeQuery != null) {
      await fetchGenRecipe(genRecipeQuery);
    } else {
      await fetchRecipe(recipeUrl);
    }
  }

  Future<void> fetchRecipe(String? recipeUrl) async {
    try {
      ApiResponse<SingleRecipe> response =
          await recipeService.getSingleRecipe(recipeUrl!);
      if (response.data == null && response.errorMessage != null) {
        state =
            state.copyWith(error: true, errorMessage: response.errorMessage);
      } else if (response.data != null && response.errorMessage == null) {
        state = state.copyWith(recipe: response.data, fetchFinished: true);
      }
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  Future<void> fetchGenRecipe(String? query) async {
    try {
      final ApiResponse<GenRecipeModel> response =
          await recipeService.postGenRecipeModel(query!);
      if (response.data == null && response.errorMessage != null) {
        state = state.copyWith(
          error: true,
          errorMessage: response.errorMessage,
        );
      } else if (response.data != null && response.errorMessage == null) {
        state = state.copyWith(
          error: false,
          fetchFinished: false,
        );
        await _fetchGenRecipeImg(response.data!);
      }
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  @override
  List<String> retrieveIngredients(SingleRecipe recipe) {
    List<String> ingredients = <String>[];
    for (Ingredient ingredient in recipe.ingredients) {
      if (ingredient.amount == "" && ingredient.unit == "") {
        ingredients.add(ingredient.name);
      } else if (ingredient.amount != "" && ingredient.unit == "") {
        ingredients.add('${ingredient.amount} ${ingredient.name}');
      } else if (ingredient.amount == "" && ingredient.unit != "") {
        ingredients.add('${ingredient.unit} ${ingredient.name}');
      } else if (ingredient.amount != "" && ingredient.unit != "") {
        ingredients
            .add('${ingredient.amount} ${ingredient.unit} ${ingredient.name}');
      }
    }
    return ingredients;
  }

  Future<void> _fetchGenRecipeImg(GenRecipeModel genRecipe) async {
    try {
      ApiResponse<String> response =
          await recipeService.postGenRecipeModelImg(genRecipe);
      if (response.data != null) {
        SingleRecipe rec = mapSingleRecipe(genRecipe, response.data!);
        state = state.copyWith(recipe: rec, error: false, fetchFinished: true);
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

  SingleRecipe mapSingleRecipe(GenRecipeModel recipe, String url) {
    var genRecipeJson = recipe.toJson();
    var singleRecipe = SingleRecipe.genRecipeFromJson(genRecipeJson);
    singleRecipe.imageUrls = [
      url
    ]; // Change the assignment to a list containing the url
    return singleRecipe;
  }

  void setGenRecipe(SingleRecipe? genRecipe) {
    try {
      state = state.copyWith(recipe: genRecipe, fetchFinished: true);
    } catch (e) {
      state = state.copyWith(
        error: true,
        errorMessage: "An unexpected error occured!",
      );
    }
  }

  @override
  void handleIncomingRequest(
      String? recipeUrl, String? genRecipeQuery, SingleRecipe? genRecipe) {
    if (recipeUrl == '' && genRecipeQuery == null && genRecipe != null) {
      setGenRecipe(genRecipe);
    } else if (recipeUrl == null &&
        genRecipeQuery != null &&
        genRecipe == null) {
      fetchGenRecipe(genRecipeQuery);
    } else {
      fetchRecipe(recipeUrl);
    }
  }
}
