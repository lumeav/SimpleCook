import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';
import 'package:simple_cook/ui/planner/widgets/date.dart';
import 'package:simple_cook/ui/planner/widgets/time_view_span.dart';

part 'planner_controller_implementation.g.dart';

@riverpod
class PlannerControllerImplementation extends _$PlannerControllerImplementation
    implements PlannerController {

  @override
  PlannerModel build() {
    DateTime data = DateTime.now();
    int dayOffset = data.weekday - DateTime.monday;
    DateTime firstDateOfWeek = data.subtract(Duration(days: dayOffset));

    DateTime lastDateofWeek = firstDateOfWeek.add(Duration(days: 6));

    List<DateTime> dates = setDatesWeek(firstDateOfWeek, data);
    return PlannerModel(
      actual: data,
      start: firstDateOfWeek,
      end: lastDateofWeek,
      dates: dates,
    );
  }

  @override
  void nextWeek() {
    DateTime data = state.start.add(const Duration(days: 7));
    state = state.copyWith(
      start: data,
      end: state.end.add(const Duration(days: 7)),
      dates: setDatesWeek(data, state.actual),
    );
    print('next week');
    print(state.dates);
  }
  @override
  void previousWeek() {
    DateTime data = state.start.subtract(const Duration(days: 7));
    if (!isSameDate(state.start, getFirstDateOfWeek())) {
      state = state.copyWith(
        start: data,
        end: state.end.subtract(const Duration(days: 7)),
        dates: setDatesWeek(data, state.actual),
      );
    }
    print('previous week');
    print(state.dates);
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
      print('111');
        int dayOffset = DateTime.sunday - actual.weekday;
        for (int i = 0; i <= dayOffset; i++) {
          dates.add(actual.add(Duration(days: i)));
        }
        return dates;
    } else {
      print('222');
      for (int i = 0; i < 7; i++) {
        dates.add(start.add(Duration(days: i)));
      }
      return dates;
    }
  }
}
