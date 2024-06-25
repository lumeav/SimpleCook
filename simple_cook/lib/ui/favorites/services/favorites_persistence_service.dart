import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipes_model.dart';

part 'favorites_persistence_service.freezed.dart';

abstract class FavoritesPersistenceService {
  FavoritesPersistenceServiceFavorites favorites();

  Future<void> loadFavoriteRecipes();
}

@freezed
@immutable
abstract class FavoritesPersistenceServiceFavorites with _$FavoritesPersistenceServiceFavorites {
  factory FavoritesPersistenceServiceFavorites({
    required final List<Recipe> favoriteRecipes,
  }) = _FavoritesPersistenceServiceFavorites;
}