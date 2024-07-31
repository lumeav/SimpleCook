import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_model.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';

part 'recipe_finder_providers.g.dart';

@riverpod
RecipeFinderController recipeFinderController(final RecipeFinderControllerRef ref) => ref.watch(
  recipeFinderControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
).notifier);

@riverpod
RecipeFinderModel recipeFinderModel(final RecipeFinderModelRef ref) => ref.watch(
  recipeFinderControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
));