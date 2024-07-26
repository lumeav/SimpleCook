import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/explore/explore_controller_implementation.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';

part 'explore_providers.g.dart';

@riverpod
ExploreController exploreController(final ExploreControllerRef ref) => ref.watch(
  exploreControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
    recipeService: ref.watch(recipeServiceProvider),
).notifier);

@riverpod
ExploreModel exploreModel(final ExploreModelRef ref) => ref.watch(
  exploreControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
    recipeService: ref.watch(recipeServiceProvider),
));