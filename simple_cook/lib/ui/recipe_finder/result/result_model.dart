import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

part 'result_model.freezed.dart';

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    GenRecipeModel? recipe,
    SingleRecipe? singleRecipe,
    String? url,
    @Default(false) bool fetchFinished,
    @Default(false) bool error,
    String? errorMessage,
  }) = _ResultModel;
}