import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_gen_model.freezed.dart';

@freezed
class RecipeGen with _$RecipeGen {
  const factory RecipeGen({
    required String title,
    required String image,
    required String url,
    required String ingredients,
    required String instructions,
  }) = _RecipeGen;
}