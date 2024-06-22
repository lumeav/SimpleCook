import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:simple_cook/service/recipe_model.dart';

class RecipeApi {

  var client = http.Client();
  final String baseUrl = 'https://gustar-io-deutsche-rezepte.p.rapidapi.com/';

  Map<String, String> headers = {
    'Content-Type' : 'application/json',
    'x-rapidapi-ua' : 'RapidAPI-Playground',
    'x-rapidapi-key' : 'a31ec4e519msh5392f43087ca131p19bf2cjsn801e5421af99',
    'x-rapidapi-host' : 'gustar-io-deutsche-rezepte.p.rapidapi.com',
    'specificMethodHeaders' : '[object Object]'
  };

  Future<List<Recipe>?> getRecipes(String? text, String? time, String? diet) async {
    //build the query
    var parameter = createQuery(text, time, diet);
    var url = baseUrl + 'search_api?' + parameter;
    print(url);

    var response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return recipeFromJson(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      throw Exception('Failed to load recipes');
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