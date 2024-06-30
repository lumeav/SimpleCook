import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/ui/planner/planner_provider.dart';
import 'package:simple_cook/ui/planner/widgets/time_view_span.dart';
import 'package:simple_cook/ui/planner/widgets/date.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/ui/planner/widgets/remove_button.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/ui/planner/planner_controller_implementation.dart';

class PlannerView extends ConsumerStatefulWidget {
  const PlannerView({
    Key? key,
  }) : super(key: key);

  @override
  _PlannerViewState createState() => _PlannerViewState();
}

class _PlannerViewState extends ConsumerState<PlannerView> {
  late PersistenceService _persistenceService;

  @override
  void initState() {
    super.initState();
    _persistenceService = PersistenceService();
    ref.read(plannerControllerImplementationProvider.notifier).build();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.grey[200],
            child: TimeViewSpan()),
        ElevatedButton(
          onPressed: () {
            _persistenceService.clearPlanner();
          },
          child: Text('Delete all Plannerrecipe'),
        ),
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
    final plannerState = ref.watch(plannerControllerImplementationProvider);
    final test = ref.watch(plannerProvider.notifier);
    final plannerProviderState = ref.watch(plannerProvider);
    List<Widget> plannerRows = [];

    for (DateTime date in plannerState.dates) {
      String formatMonth = DateFormat('MM').format(date);
      String formatDay = DateFormat('dd').format(date);

      String formattedDate = '${formatDay}.${formatMonth}.${date.year}';
      List<SingleRecipe> recipes = test.getRecipesForDate(formattedDate);
      plannerRows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Date(date),
              SizedBox(height: 5),
              recipes.isEmpty
                  ? Center(child: Text('No recipes added for this date'))
                  : _buildRecipeWidgets(
                      plannerProviderState[formattedDate]!, formattedDate),
            ],
          ),
        ),
      );
    }
    return plannerRows;
  }

  Widget _buildRecipeWidgets(List<SingleRecipe> recipes, String date) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return _buildRecipeWidget(recipe, date);
      },
    );
  }

  Widget _buildRecipeWidget(SingleRecipe recipe, String date) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
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
                recipe.title, recipe.totalTime.toStringAsFixed(0), ''),
            recipe.imageUrls.first,
            recipe.title,
            recipe.source,
            ''),
      ],
    );
  }
}
