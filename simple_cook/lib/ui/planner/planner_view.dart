import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/customNavBar.dart';
import 'package:simple_cook/widgets/extendedRecipe.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/timeViewSpan.dart';
import 'package:simple_cook/widgets/date.dart';
import 'package:simple_cook/widgets/removeButton.dart';
import 'package:simple_cook/widgets/headerRecipeInfos.dart';

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
      body: Column(children: [
        Container(padding: EdgeInsets.symmetric(vertical: 5), color: Colors.grey[200], child: TimeViewSpan()),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ..._buildRowsRecipe(_buildRecipeWidgets()),
            ],
          ),
        )),
      ]),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
    List<Widget> reciperows = [];
    for (int i = 0; i < recipeWidgets.length; i++) {
      reciperows.add(
        Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 10.0, bottom: 10.0),
            child: recipeWidgets[i]),
      );
    }
    return reciperows;
  }

  List<Widget> _buildRecipeWidgets() {
    List<Widget> recipeWidgets = [];
    for (int i = 0; i < 7; i++) {
      recipeWidgets.add(
        Column(children: [
          Row(children: [
            Flexible(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Date(DateTime.now().add(Duration(days: i))))),
            Align(alignment: Alignment.centerRight, child: RemoveButton())
          ]),
          ExtendedRecipe(
              'assets/flammkuchen.jpg', HeaderRecipeInfos('Flammkuchen', "30min", "einfach")),
        ]),
      );
    }
    return recipeWidgets;
  }
}
