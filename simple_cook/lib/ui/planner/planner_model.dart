import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

part 'planner_model.freezed.dart';

@freezed
class PlannerModel with _$PlannerModel {
  const factory PlannerModel({
    required DateTime start,
    required DateTime actual,
    required DateTime end,
    required List<DateTime> dates,
    required Map<String, List<SingleRecipe>> recipes,
  }) = _PlannerModel;
}
