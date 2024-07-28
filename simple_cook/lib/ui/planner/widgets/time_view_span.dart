import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';
import 'package:simple_cook/ui/planner/planner_providers.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';

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
    ref.read(plannerControllerProvider);
  }


  void _onPressed(PlannerController planner, String buttonType) {
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
    final PlannerController plannerController = ref.watch(plannerControllerProvider);
    final PlannerModel plannerModel = ref.watch(plannerModelProvider);
    return Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              onPressed: () => _onPressed(plannerController, 'prev'),
              icon:
                  const Icon(Icons.chevron_left, color: Colors.grey, size: 32)),
          Flexible(
            child: Text(
                "Wochenplan ${DateFormat('dd.MM', 'de_DE').format(plannerModel.start)} - ${DateFormat('dd.MM', 'de_DE').format(plannerModel.end)}",
                style: SimpleCookTextstyles.header),
          ),
          IconButton(
              onPressed: () => _onPressed(plannerController, 'next'),
              icon:
                  const Icon(Icons.chevron_right, color: Colors.grey, size: 32))
        ],
      ),
    );
  }
}
