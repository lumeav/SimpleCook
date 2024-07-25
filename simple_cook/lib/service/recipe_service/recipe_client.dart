import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/img_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/img_url.dart';
import 'package:simple_cook/common/config.dart';

class RecipeClient {
  final http.Client client = http.Client();

  final String baseUrl = Config.baseUrl;

  final Map<String, String> headers = Config.headers;

  Future<ApiResponse<List<Recipe>?>> getRecipes(String parameter) async {
    final String url = baseUrl + 'search_api?text=' + parameter;
    print(url);
    return await _handleRequest(() async {
      var response = await client
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return ApiResponse<List<Recipe>?>(
            data: recipeFromJson(
                const Utf8Decoder().convert(response.bodyBytes)));
      } else if (response.statusCode == 429 || response.statusCode == 403) {
        return ApiResponse<List<Recipe>?>(
            errorMessage:
                'The API key has expired! Please upgrade on $baseUrl');
      } else {
        return ApiResponse<List<Recipe>?>(
            errorMessage: 'Failed to load recipes. Check for connection!');
      }
    });
  }

  Future<ApiResponse<SingleRecipe>> getSingleRecipe(String recipeUrl) async {
    final String url = baseUrl + 'crawl?target_url=' + recipeUrl;

    return await _handleRequest(() async {
      var response = await client
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return ApiResponse<SingleRecipe>(
            data: SingleRecipe.fromJson(
                jsonDecode(const Utf8Decoder().convert(response.bodyBytes))));
      } else if (response.statusCode == 429 || response.statusCode == 403) {
        return ApiResponse<SingleRecipe>(
            errorMessage:
                'The API key has expired! Please upgrade on $baseUrl');
      } else {
        return ApiResponse<SingleRecipe>(
            errorMessage: 'Failed to load recipe. Check for connection!');
      }
    });
  }

  Future<ApiResponse<GenRecipeModel>> postGenRecipeModel(String request) async {
    return await _handleRequest(() async {
      var response = await client
          .post(
            Uri.parse(baseUrl + 'generateRecipe'),
            headers: headers,
            body: jsonEncode({'text': request}),
          )
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var genRecipe =
            genRecipeFromJson(const Utf8Decoder().convert(response.bodyBytes));
        return ApiResponse<GenRecipeModel>(data: genRecipe);
      } else if (response.statusCode == 429 || response.statusCode == 403) {
        return ApiResponse<GenRecipeModel>(
            errorMessage:
                'The API key has expired! Please upgrade on $baseUrl');
      } else {
        return ApiResponse<GenRecipeModel>(
            errorMessage: 'Failed to load recipe. Check for connection!');
      }
    });
  }

  Future<ApiResponse<String>> postGenRecipeModelImg(
      GenRecipeModel recipe) async {
    return await _handleRequest(() async {
      var genRecipeJson = genRecipeToJson(recipe);
      var imgRecipe = imgRecipeFromJson(genRecipeJson);
      var imgRecipeJson = imgRecipeToJson(imgRecipe);
      var response = await client
          .post(
            Uri.parse(baseUrl + 'generateRecipeImage'),
            headers: headers,
            body: imgRecipeJson,
          )
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var imgUrl =
            urlFromJson(const Utf8Decoder().convert(response.bodyBytes));
        return ApiResponse<String>(data: imgUrl.url);
      } else if (response.statusCode == 429 || response.statusCode == 403) {
        return ApiResponse<String>(
            errorMessage:
                'The API key has expired! Please upgrade on $baseUrl');
      } else {
        return ApiResponse<String>(
            errorMessage: 'Failed to load recipe image. Check for connection!');
      }
    });
  }

  Future<ApiResponse<T>> _handleRequest<T>(
      Future<ApiResponse<T>> Function() requestFunction) async {
    try {
      return await requestFunction();
    } on TimeoutException {
      return ApiResponse<T>(
          errorMessage:
              'The connection has timed out. Please try again later.');
    } on SocketException {
      return ApiResponse<T>(errorMessage: 'No Internet connection.');
    } on http.ClientException {
      return ApiResponse<T>(
          errorMessage: 'Network error. Check for connection!');
    } catch (e) {
      return ApiResponse<T>(errorMessage: 'Unexpected error.');
    }
  }
}
