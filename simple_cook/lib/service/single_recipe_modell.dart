import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'single_recipe_model.freezed.dart';
part 'single_recipe_model.g.dart';


SingleRecipe singleRecipeFromJson(String str) =>
    SingleRecipe.fromJson(json.decode(str));

String singleRecipeToJson(SingleRecipe data) => json.encode(data.toJson());

@freezed
class SingleRecipe with _$SingleRecipe {
  factory SingleRecipe({
    required List<String>? diet,
    required List<String> imageUrls,
    required List<Ingredient> ingredients,
    required int portions,
    required String source,
    required List<String> steps,
    required String title,
    required double totalTime,
  }) = _SingleRecipe;

  factory SingleRecipe.fromJson(Map<String, dynamic> json) {
      return SingleRecipe(
        diet: json["diet"] == null
            ? []
            : List<String>.from(json["diet"].map((x) => x)),
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        portions: json["portions"],
        source: json["source"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        title: json["title"],
        totalTime: json["totalTime"] / 60,
      );
  }
}

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required String amount,
    required String name,
    required String unit,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
