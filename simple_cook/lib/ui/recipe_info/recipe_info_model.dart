import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_info_model.freezed.dart';

@freezed
class RecipeInfoModel with _$RecipeInfoModel {
  const factory RecipeInfoModel({
    SingleRecipe? recipe,
    @Default(false) bool fetchFinished,
    @Default(false) bool error,
    String? errorMessage,
  }) = _RecipeInfoModel;
}