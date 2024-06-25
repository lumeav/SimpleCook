import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipes_model.dart';

part 'favorites_model.freezed.dart';

@freezed
class FavoritesModel with _$FavoritesModel {
  factory FavoritesModel({
    required List<Recipe> recipes,
  }) = _FavoritesModel;
}