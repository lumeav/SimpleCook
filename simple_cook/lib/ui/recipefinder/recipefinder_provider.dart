import 'package:flutter/material.dart';
 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';

class RecipeFinderProvider extends StateNotifier<List<String>> {
  RecipeFinderProvider() : super([]);

  void setFilterActive(String name) {
    state.add(name);
  }

  void setFilterInactive(String name) {
    state.remove(name);
  }

  void clearFilter() {
    state.clear();
  }

  String getFilter() {
    return state.join(' ');
  }
}

final recipeFinderProvider = StateNotifierProvider<RecipeFinderProvider, List<String>>((ref) {
  return RecipeFinderProvider();
});


