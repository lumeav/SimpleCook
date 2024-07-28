import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';

abstract class ResultRecipeService {
  Future<ApiResponse<GenRecipeModel>> postGenRecipeModel(String request);
  Future<ApiResponse<String>> postGenRecipeModelImg(GenRecipeModel recipe);
}