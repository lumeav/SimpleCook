import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_client.dart';
import 'package:simple_cook/service/recipe_service/recipe_service_aggregator.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_service.g.dart';

@Riverpod(keepAlive: true)
RecipeServiceAggregator recipeService(
  final RecipeServiceRef ref,
) => RecipeService();

class RecipeService extends RecipeServiceAggregator {
  static final RecipeService _instance = RecipeService._internal();

  factory RecipeService() {
    return _instance;
  }

  RecipeService._internal();

  final RecipeClient api = RecipeClient();

  @override
  Future<ApiResponse<List<Recipe>?>> getAllRecipes(String text) async {
    return api.getRecipes(text);
  }

  @override
  Future<ApiResponse<SingleRecipe>> getSingleRecipe(String recipeUrl) async {
    return api.getSingleRecipe(recipeUrl);
  }

  @override
  Future<ApiResponse<GenRecipeModel>> postGenRecipeModel(String request) async {
    return api.postGenRecipeModel(request);
  }

  @override
  Future<ApiResponse<String>> postGenRecipeModelImg(GenRecipeModel recipe) async {
    return api.postGenRecipeModelImg(recipe);
  }
}