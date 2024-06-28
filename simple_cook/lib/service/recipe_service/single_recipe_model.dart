import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'single_recipe_model.freezed.dart';
part 'single_recipe_model.g.dart';

/*
SingleRecipe singleRecipeFromJson(String str) =>
    SingleRecipe.fromJson(json.decode(str));

String singleRecipeToJson(SingleRecipe data) => json.encode(data.toJson());
*/
@freezed
class SingleRecipe with _$SingleRecipe {
  @JsonSerializable(explicitToJson: true)
  const factory SingleRecipe({
    required List<String>? diet,
    required List<String> image_urls,
    required List<Ingredient> ingredients,
    required int portions,
    required String source,
    required List<String> steps,
    required String title,
    required double totalTime,
  }) = _SingleRecipe;

  factory SingleRecipe.fromJson(Map<String, dynamic> json) =>
      _$SingleRecipeFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  @JsonSerializable(explicitToJson: true)
  const factory Ingredient({
    required String amount,
    required String name,
    required String unit,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
