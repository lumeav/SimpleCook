import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/wochenPlanerRecipe.dart';
import 'package:simple_cook/widgets/timeViewSpan.dart';
import 'package:simple_cook/widgets/date.dart';
import 'package:simple_cook/widgets/removeButton.dart';


class PlannerView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const PlannerView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _PlannerViewState createState() => _PlannerViewState();
}

class _PlannerViewState extends State<PlannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      body: GreyBackground([
        TimeViewSpan(),
        Row(children: [Date(DateTime.now()), SizedBox(width: 120.0), RemoveButton()]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),
        Row(children: [Date(DateTime.now().add(Duration(days: 1))), SizedBox(width: 120.0), RemoveButton()]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),
        Row(children: [Date(DateTime.now().add(Duration(days: 2))), SizedBox(width: 120.0), RemoveButton()]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),
        Row(children: [Date(DateTime.now().add(Duration(days: 3))), SizedBox(width: 120.0), RemoveButton()]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),
      ]),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }
}
