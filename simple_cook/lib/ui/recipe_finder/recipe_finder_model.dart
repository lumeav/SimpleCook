import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_finder_model.freezed.dart';

@freezed
class RecipeFinderModel with _$RecipeFinderModel {
  const factory RecipeFinderModel({
    required List<String> activeFilters,
    @Default([
      'Alle',
      'Vorspeise',
      'Hauptspeise',
      'Dessert',
      'Snacks',
    ]) List<String> categories,
    @Default([
      'Alle',
      'Vegetarisch',
      'Vegan',
      'Glutenfrei',
      'Laktosefrei',
    ]) List<String> diets,
  }) = _RecipeFinderModel;
}