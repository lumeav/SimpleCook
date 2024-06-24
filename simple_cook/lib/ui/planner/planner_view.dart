import 'package:flutter/material.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/time_view_span.dart';
import 'package:simple_cook/widgets/date.dart';
import 'package:simple_cook/widgets/remove_button.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';

class PlannerView extends StatefulWidget {

  const PlannerView({
    Key? key,
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
          //ExtendedRecipe(
          //    'assets/flammkuchen.jpg', HeaderRecipeInfos('Flammkuchen', "30min", "einfach")),
        ]),
      );
    }
    return recipeWidgets;
  }
}
