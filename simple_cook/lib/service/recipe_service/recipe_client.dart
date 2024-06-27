import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/gen_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/img_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/img_Url_model.dart';


class RecipeClient {

  var client = http.Client();
  final String baseUrl = 'https://gustar-io-deutsche-rezepte.p.rapidapi.com/';

  Map<String, String> headers = {
    'x-rapidapi-host' : 'gustar-io-deutsche-rezepte.p.rapidapi.com',
    'x-rapidapi-key' : 'ef7514451cmsh370313fb35a05f4p1496c9jsn41a71594229c',
  };

  Future<List<Recipe>?> getRecipes(String parameter) async {

    var url = baseUrl + 'search_api?text=' + parameter;
  print(url);
    var response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return recipeFromJson(const Utf8Decoder().convert(response.bodyBytes));
    } else {
       throw Exception('Failed to load recipes. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }

  Future<SingleRecipe> getSingleRecipe(String recipeUrl) async {

    var url = baseUrl + 'crawl?target_url=' + recipeUrl;

    var response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return singleRecipeFromJson(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      throw Exception('Failed to load recipes. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }

  Future<GenRecipe> postGenRecipe(String request) async {

    var response = await client.post(Uri.parse(baseUrl + 'generateRecipe'), headers: headers, body: jsonEncode({'text': request}));

    if (response.statusCode == 200) {
      var genRecipe = genRecipeFromJson(const Utf8Decoder().convert(response.bodyBytes));
      print('response genrecipe: $genRecipe');
      return genRecipe;
    } else {
      throw Exception('Failed to load recipes. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }

  Future<String> postGenRecipeImg(GenRecipe recipe) async {

      var genRecipeJson = genRecipeToJson(recipe);
      var imgRecipe = imgRecipeFromJson(genRecipeJson);
      var imgRecipeJson = imgRecipeToJson(imgRecipe);
      var imgResponse = await client.post(Uri.parse(baseUrl + 'generateRecipeImage'), headers: headers, body: imgRecipeJson);

      if (imgResponse.statusCode == 200) {
          var imgUrl = urlFromJson(const Utf8Decoder().convert(imgResponse.bodyBytes));
          print('imgUrl: ${imgUrl.url}');
          return imgUrl.url;
          /*
          var imgUrl = urlFromJson(const Utf8Decoder().convert(imgResponse.bodyBytes));
          print(imgUrl.url);
          recipe.imgUrl = imgUrl.url;
          print('genRecipe MAPED: $recipe');
          return recipe;*
  */
      } else {
          throw Exception('Failed to load recipes. Status code: ${imgResponse.statusCode}, Response body: ${imgResponse.body}');
      }

  }


}