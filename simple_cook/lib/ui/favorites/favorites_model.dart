import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

part 'favorites_model.freezed.dart';

@freezed
class FavoritesModel with _$FavoritesModel {
  const factory FavoritesModel({
    @Default(<SingleRecipe>[]) List<SingleRecipe> favoriteRecipes,
  }) = _FavoritesModel;
}

