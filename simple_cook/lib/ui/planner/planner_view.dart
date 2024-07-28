import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/ui/planner/planner_model.dart';
import 'package:simple_cook/ui/planner/widgets/time_view_span.dart';
import 'package:simple_cook/ui/planner/widgets/date.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/ui/planner/widgets/remove_button.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/common/widgets/extended_recipe.dart';
import 'package:simple_cook/common/widgets/header_recipe_infos.dart';
import 'planner_providers.dart';

class PlannerView extends ConsumerStatefulWidget {
  const PlannerView({
    super.key,
  });

  @override
  PlannerViewState createState() => PlannerViewState();
}

class PlannerViewState extends ConsumerState<PlannerView> {

  @override
  void initState() {
    super.initState();
    ref.read(plannerControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.grey[200],
            child: const TimeViewSpan()),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: _buildPlannerRows(),
          ),
        )),
      ]),
    );
  }

  List<Widget> _buildPlannerRows() {
    final PlannerModel plannerModel =
        ref.watch(plannerModelProvider);
    final PlannerController planner = ref.watch(plannerControllerProvider);
    List<Widget> plannerRows = <Widget>[];

    bool hasRecipesForWeek = false;

    for (DateTime date in plannerModel.dates) {

      String formattedDate = DateFormat('dd.MM.yyyy').format(date);
      List<SingleRecipe> recipes = planner.getRecipesForDate(formattedDate);
      if (recipes.isNotEmpty) {
        hasRecipesForWeek = true;

        plannerRows.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Date(date),
                const SizedBox(height: 5),
                _buildRecipeWidgets(
                    planner.loadPlanner()[formattedDate]!, formattedDate),
              ],
            ),
          ),
        );
      }
    }
    if (!hasRecipesForWeek) {
        plannerRows.add(
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                'Keine Rezepte für diese Woche hinzugefügt',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
          ),
        );
      }
    return plannerRows;
  }

  Widget _buildRecipeWidgets(List<SingleRecipe> recipes, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final SingleRecipe recipe = recipes[index];
          return _buildRecipeWidget(recipe, date);
        },
      ),
    );
  }

  Widget _buildRecipeWidget(SingleRecipe recipe, String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: RemoveButton(
              recipe: recipe,
              date: date,
            ),
          ),
          ExtendedRecipe(
              HeaderRecipeInfos(
                  recipe.title, recipe.totalTime.toStringAsFixed(0)),
              recipe.imageUrls.first,
              recipe.title,
              recipe.source),
        ],
      ),
    );
  }
}

abstract class PlannerController {
  void nextWeek();
  void previousWeek();
  Map<String, List<SingleRecipe>> loadPlanner();
  Future<void> addPlanner(String date, SingleRecipe recipe);
  Future<void> removePlanner(String date, SingleRecipe recipe);
  List<SingleRecipe> getRecipesForDate(String date);
}