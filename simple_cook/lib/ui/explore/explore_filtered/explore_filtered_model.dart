import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_filtered_model.freezed.dart';

@freezed
class ExploreFilteredModel with _$ExploreFilteredModel {
  const factory ExploreFilteredModel({
    List<Recipe>? filteredRecipes,
    @Default(false) bool fetchFinished,
    @Default(false) bool error,
    String? errorMessage,
  }) = _ExploreFilteredModel;
}

