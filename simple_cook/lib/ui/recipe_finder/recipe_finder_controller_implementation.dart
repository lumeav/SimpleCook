import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_model.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';
import 'package:simple_cook/ui/recipe_finder/services/recipe_finder_persistence_service.dart';

part 'recipe_finder_controller_implementation.g.dart';

@riverpod
class RecipeFinderControllerImplementation extends _$RecipeFinderControllerImplementation
  implements RecipeFinderController {

  @override
  RecipeFinderModel build({
    required final RecipeFinderPersistenceService persistenceService,
  }) => const RecipeFinderModel(activeFilters: <String>[]);

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

  @override
  Future<List<String>> loadSearchBox() async {
    final List<String> searchHistory = persistenceService.getSearchBox();
    return searchHistory;
  }

  @override
  Future<void> addSearchQuery(String query) async {
    await persistenceService.addToSearchBox(query);
  }

  @override
  Future<Iterable<String>> search(String query) async {
    return await persistenceService.search(query);
  }
}