import 'package:hive/hive.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class PersistenceService {
  static final PersistenceService _instance = PersistenceService._internal();

  factory PersistenceService() {
    return _instance;
  }

  PersistenceService._internal();

  late Box<SingleRecipe> _favoritesBox;

  Future<void> init() async {
    //await Hive.deleteFromDisk();
    _favoritesBox = await Hive.openBox<SingleRecipe>('favoritesBox');
  }

  Future<void> clearFavorites() async {
  await _favoritesBox.clear();
}

  List<SingleRecipe> getFavoriteRecipes() {
    return _favoritesBox.values.toList();
  }

  bool isFavorite(SingleRecipe recipe) {
    return _favoritesBox.containsKey(recipe.title);
  }

  Future<void> addFavorite(SingleRecipe recipe) async {
    await _favoritesBox.put(recipe.title, recipe);
  }

  Future<void> removeFavorite(SingleRecipe recipe) async {
    await _favoritesBox.delete(recipe.title);
  }
}