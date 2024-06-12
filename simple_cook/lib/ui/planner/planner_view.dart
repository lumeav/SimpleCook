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
      backgroundColor: Colors.grey[200],
      body:
      Column(children: [
        Container(
          color: Colors.grey[200],
          child: TimeViewSpan()
        ),
      Expanded( child: GreyBackground([
        Column(children: [Row(children: [Align(alignment: Alignment.centerLeft, child: Date(DateTime.now())), Spacer(), Align(alignment: Alignment.centerRight, child: RemoveButton())]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),]),
        Column(children: [Row(children: [Align(alignment: Alignment.centerLeft, child: Date(DateTime.now().add(Duration(days: 1)))), Spacer(), Align(alignment: Alignment.centerRight, child: RemoveButton())]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),]),
        Column(children: [Row(children: [Align(alignment: Alignment.centerLeft, child: Date(DateTime.now().add(Duration(days: 2)))), Spacer(), Align(alignment: Alignment.centerRight, child: RemoveButton())]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),]),
        Column(children: [Row(children: [Align(alignment: Alignment.centerLeft, child: Date(DateTime.now().add(Duration(days: 3)))), Spacer(), Align(alignment: Alignment.centerRight, child: RemoveButton())]),
        WochenplanerRecipe('assets/flammkuchen.jpg', 'Flammkuchen', "30min", "einfach"),]),
      ])),]),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }
}
