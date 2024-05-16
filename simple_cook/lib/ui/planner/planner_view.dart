import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';

class PlannerView extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onItemTapped;

  PlannerView({Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CommonView(
      selectedIndex: selectedIndex,
      onItemTapped: onItemTapped,
      child: Center(
        child: Text('Planner View'),
      ),
    );
  }
}