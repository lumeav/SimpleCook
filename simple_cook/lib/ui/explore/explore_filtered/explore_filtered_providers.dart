import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_controller_implementation.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_model.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_view.dart';

part 'explore_filtered_providers.g.dart';

@riverpod
ExploreFilteredController exploreFilteredController(final ExploreFilteredControllerRef ref) => ref.watch(
  exploreFilteredControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
).notifier);

@riverpod
ExploreFilteredModel exploreFilteredModel(final ExploreFilteredModelRef ref) => ref.watch(
  exploreFilteredControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
));