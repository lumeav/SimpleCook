import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/ui/planner/planner_controller_implementation.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';

part 'planner_providers.g.dart';

@riverpod
PlannerController plannerController(final PlannerControllerRef ref) => ref.watch(
  plannerControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
).notifier);

@riverpod
PlannerModel plannerModel(final PlannerModelRef ref) => ref.watch(
  plannerControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
));