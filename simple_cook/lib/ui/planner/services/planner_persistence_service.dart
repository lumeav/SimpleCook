import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipes_model.dart';

part 'planner_persistence_service.freezed.dart';

abstract class PlannerPersistenceService {
  PlannerPersistenceServicePlanner planner();
}

@freezed
@immutable
abstract class PlannerPersistenceServicePlanner with _$PlannerPersistenceServicePlanner {
  factory PlannerPersistenceServicePlanner({
    required final Map<DateTime, Recipe> recipeMapping,
  }) = _PlannerPersistenceServicePlanner;
}