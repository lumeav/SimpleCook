import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class RecipeClient {

  var client = http.Client();
  final String baseUrl = 'https://gustar-io-deutsche-rezepte.p.rapidapi.com/';

  Map<String, String> headers = {
    'x-rapidapi-host' : 'gustar-io-deutsche-rezepte.p.rapidapi.com',
    'x-rapidapi-key' : 'c8b7b6419bmshc6806e6941f2ff2p19aa9fjsn6b22a136729f',
  };

  Future<List<Recipe>?> getRecipes(String text, String? time, String? diet) async {
    //build the query
    var parameter = createQuery(text, time, diet);
    var url = baseUrl + 'search_api?' + parameter;
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

  String createQuery(String ?text, String ?time, String ?diet) {
    List<String> queryList = [];
    if (text != null) {
      queryList.add('text=$text');
    }
    if (time != null) {
      queryList.add('time=$time');
    }
    if (diet != null) {
      queryList.add('diet=$diet');
    }
    if (queryList.isEmpty) {
      return '';
    }
    return queryList.join('&');
  }

}