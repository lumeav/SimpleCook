import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlannerViewState();
}

class _PlannerViewState extends ConsumerState<PlannerView> {
  @override
  void initState() {
    super.initState();
    ref.read(plannerControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.grey[200],
            child: TimeViewSpan()),
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
    final planner = ref.watch(plannerControllerProvider);
    final plannerModel = ref.watch(plannerModelProvider);
    List<Widget> plannerRows = [];

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
              children: [
                Date(date),
                SizedBox(height: 5),
                _buildRecipeWidgets(
                    plannerModel.recipes[formattedDate]!, formattedDate),
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return _buildRecipeWidget(recipe, date);
        },
      ),
    );
  }

  Widget _buildRecipeWidget(SingleRecipe recipe, String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
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
              recipe.source ?? '',
              recipe),
        ],
      ),
    );
  }
}

abstract class PlannerController {
  void nextWeek();
  void previousWeek();
  Future<void> loadPlanner();
  Future<bool> addPlanner(String date, SingleRecipe recipe);
  Future<void> removePlanner(String date, SingleRecipe recipe);
  List<SingleRecipe> getRecipesForDate(String date);
}
