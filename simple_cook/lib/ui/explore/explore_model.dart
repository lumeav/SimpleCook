import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_model.freezed.dart';

@freezed
class ExploreModel with _$ExploreModel {
  const factory ExploreModel({
    List<Recipe>? recipes,
    Recipe? recipeOfTheDay,
    @Default(false) bool isSearching,
    @Default(false) bool error,
    String? errorMessage,
  }) = _ExploreModel;
}

