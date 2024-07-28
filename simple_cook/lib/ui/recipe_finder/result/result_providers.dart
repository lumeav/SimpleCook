import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_model.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_view.dart';

part 'result_providers.g.dart';

@riverpod
ResultController resultController(final ResultControllerRef ref) => ref.watch(
  resultControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
).notifier);

@riverpod
ResultModel resultModel(final ResultModelRef ref) => ref.watch(
  resultControllerImplementationProvider(
    recipeService: ref.watch(recipeServiceProvider),
));