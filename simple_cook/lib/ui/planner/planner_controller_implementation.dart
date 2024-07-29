// ignore_for_file: always_specify_types

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/planner/services/planner_persistence_service.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';

part 'planner_controller_implementation.g.dart';

@riverpod
class PlannerControllerImplementation extends _$PlannerControllerImplementation
    implements PlannerController {
  @override
  PlannerModel build({
    required final PlannerPersistenceService persistenceService,
  }) {
    DateTime data = DateTime.now();
    int dayOffset = data.weekday - DateTime.monday;
    DateTime firstDateOfWeek = data.subtract(Duration(days: dayOffset));
    DateTime lastDateofWeek = firstDateOfWeek.add(const Duration(days: 6));

    List<DateTime> dates = setDatesWeek(firstDateOfWeek, data);
    return PlannerModel(
      actual: data,
      start: firstDateOfWeek,
      end: lastDateofWeek,
      dates: dates,
      recipes: persistenceService.loadPlanner(),
    );
  }

  @override
  void nextWeek() {
    DateTime nextWeekStart = state.start.add(const Duration(days: 7));
    DateTime maxAllowedDate =
        getFirstDateOfWeek().add(const Duration(days: 14));
    if (nextWeekStart.isBefore(maxAllowedDate) ||
        nextWeekStart.isAtSameMomentAs(maxAllowedDate)) {
      state = state.copyWith(
        start: nextWeekStart,
        end: state.end.add(const Duration(days: 7)),
        dates: setDatesWeek(nextWeekStart, state.actual),
      );
    }
  }

  @override
  void previousWeek() {
    DateTime prevWeekStart = state.start.subtract(const Duration(days: 7));
    if (!isSameDate(state.start, getFirstDateOfWeek())) {
      state = state.copyWith(
        start: prevWeekStart,
        end: state.end.subtract(const Duration(days: 7)),
        dates: setDatesWeek(prevWeekStart, state.actual),
      );
    }
  }

  DateTime getFirstDateOfWeek() {
    DateTime data = DateTime.now();
    int dayOffset = data.weekday - DateTime.monday;
    DateTime firstDateOfWeek = data.subtract(Duration(days: dayOffset));
    return firstDateOfWeek;
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<DateTime> setDatesWeek(DateTime start, DateTime actual) {
    List<DateTime> dates = [];
    if (isSameDate(start, getFirstDateOfWeek())) {
      int dayOffset = DateTime.sunday - actual.weekday;
      for (int i = 0; i <= dayOffset; i++) {
        dates.add(actual.add(Duration(days: i)));
      }
      return dates;
    } else {
      for (int i = 0; i < 7; i++) {
        dates.add(start.add(Duration(days: i)));
      }
      return dates;
    }
  }

  @override
  Future<void> loadPlanner() async  {
    final plannerRecipes = Map<String, List<SingleRecipe>>.from(persistenceService.loadPlanner());
    state = state.copyWith(
      actual: DateTime.now(),
      recipes: plannerRecipes,
    );
  }

  @override
  Future<void> addPlanner(String date, SingleRecipe recipe) async {
    List<SingleRecipe> recipes = await persistenceService.getRecipesForDate(date);
    if(!recipes.any((r) => r.title == recipe.title)){
      await persistenceService.addRecipeToPlanner(date, recipe);
      loadPlanner();
    }
  }

  @override
  Future<void> removePlanner(String date, SingleRecipe recipe) async {
    await persistenceService.removeRecipeFromPlanner(date, recipe);
    loadPlanner();
  }

  @override
  List<SingleRecipe> getRecipesForDate(String date) {
    return persistenceService.getRecipesForDate(date);
  }
}
