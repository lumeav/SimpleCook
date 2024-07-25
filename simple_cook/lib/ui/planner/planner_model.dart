import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_model.freezed.dart';

@freezed
class PlannerModel with _$PlannerModel {
  const factory PlannerModel({
    required DateTime start,
    required DateTime actual,
    required DateTime end,
    required List<DateTime> dates,
  }) = _PlannerModel;
}
