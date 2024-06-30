import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/planner/planner_controller_implementation.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';

class TimeViewSpan extends ConsumerStatefulWidget {

  const TimeViewSpan({
    super.key,
  });

  @override
  ConsumerState<TimeViewSpan> createState() => _TimeViewSpanState();
}

class _TimeViewSpanState extends ConsumerState<TimeViewSpan> {


  @override
  void initState() {
    super.initState();
    ref.read(plannerControllerImplementationProvider.notifier).build();
  }


  void _onPressed(PlannerControllerImplementation planner, String buttonType) {
    setState(() {
      if (buttonType == 'prev') {
        planner.previousWeek();
      } else if (buttonType == 'next') {
        planner.nextWeek();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final plannerNotifier = ref.watch(plannerControllerImplementationProvider.notifier);
    return Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () => _onPressed(plannerNotifier, 'prev'),
              icon:
                  const Icon(Icons.chevron_left, color: Colors.grey, size: 32)),
          Flexible(
            child: Text(
                "Wochenplan ${DateFormat('dd.MM', 'de_DE').format(plannerNotifier.state.start!)} - ${DateFormat('dd.MM', 'de_DE').format(plannerNotifier.state.end!)}",
                style: SimpleCookTextstyles.header),
          ),
          IconButton(
              onPressed: () => _onPressed(plannerNotifier, 'next'),
              icon:
                  const Icon(Icons.chevron_right, color: Colors.grey, size: 32))
        ],
      ),
    );
  }
}

abstract class PlannerController {
  PlannerModel build();
  void nextWeek();
  void previousWeek();
}
