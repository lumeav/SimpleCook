import 'package:flutter/material.dart';
//import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/time_view_span.dart';
import 'package:simple_cook/widgets/date.dart';
import 'package:simple_cook/widgets/remove_button.dart';
//import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/service/persistence_service.dart';
import 'package:simple_cook/service/single_recipe_model.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';

class PlannerView extends StatefulWidget {
  const PlannerView({
    Key? key,
  }) : super(key: key);

  @override
  _PlannerViewState createState() => _PlannerViewState();
}

class _PlannerViewState extends State<PlannerView> {
  late PersistenceService _persistenceService;

  @override
  void initState() {
    super.initState();
    _persistenceService = PersistenceService();
    _initializePlannerBox();
  }

  Future<void> _initializePlannerBox() async {
    await _persistenceService.init();
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
    DateTime today = DateTime.now();
    List<Widget> plannerRows = [];
    
    for (int i = 0; i < 7; i++) {
      DateTime date = today.add(Duration(days: i));
      String formattedDate = '${date.day}.${date.month}.${date.year}';
      List<SingleRecipe> recipes = _persistenceService.getRecipesForDate(formattedDate);

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
                  : _buildRecipeWidgets(recipes),
            ],
          ),
        ),
      );
    }
    return plannerRows; 
  }

  Widget _buildRecipeWidgets(List<SingleRecipe> recipes) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return _buildRecipeWidget(recipe);
      },
    );
  }

  Widget _buildRecipeWidget(SingleRecipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleRecipe(
          recipe.image_urls.isNotEmpty ? recipe.image_urls.first : '',
          recipe.title,
          recipe.source,
          '', // Replace with actual difficulty
        ),
        RemoveButton(
          recipe: recipe,
          onPressed: (recipe) {
            _removeRecipeFromPlanner(recipe);
          },
        ),
      ],
    );
  }

  Future<void> _removeRecipeFromPlanner(SingleRecipe recipe) async {
    String formattedDate = '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    await _persistenceService.removeRecipeFromPlanner(formattedDate, recipe);
    setState(() {
      // Refresh UI after removal
    });
  }
}
