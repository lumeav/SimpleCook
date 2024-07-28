import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_model.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_view.dart';

part 'recipe_info_providers.g.dart';

@riverpod
RecipeInfoController recipeInfoController(final RecipeInfoControllerRef ref) => ref.watch(
  recipeInfoControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
).notifier);

@riverpod
RecipeInfoModel recipeInfoModel(final RecipeInfoModelRef ref) => ref.watch(
  recipeInfoControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
));