import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_model.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';

part 'recipe_finder_controller_implementation.g.dart';

@riverpod
class RecipeFinderControllerImplementation extends _$RecipeFinderControllerImplementation
  implements RecipeFinderController {

  @override
  RecipeFinderModel build() => const RecipeFinderModel(activeFilters: []);

  @override
  void setFilterActive(String name) {
    state = state.copyWith(
      activeFilters: List<String>.from(state.activeFilters)..add(name),
    );
  }

  @override
  void setFilterInactive(String name) {
    state = state.copyWith(
      activeFilters: List<String>.from(state.activeFilters)..remove(name),
    );
  }

  @override
  String getFilter() {
    return state.activeFilters.join(' ');
  }
}