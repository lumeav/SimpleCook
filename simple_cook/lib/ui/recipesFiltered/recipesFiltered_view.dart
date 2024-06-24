import 'package:flutter/material.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/widgets/search_bar_explore.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/filter_button.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';


class RecipesFilteredView extends StatefulWidget {

  const RecipesFilteredView({
    Key? key,
  }) : super(key: key);

  @override
  _RecipesTagViewState createState() => _RecipesTagViewState();
}

class _RecipesTagViewState extends State<RecipesFilteredView> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            toolbarHeight: 80,
            title: Container(

              //color: Colors.white,
              child: const Row(children: [
                Expanded(child: SearchBarExplore()),
                FilterButton(),
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HeaderGreyBackground('Gefundene Rezepte', FontWeight.w300),
                ..._buildRowsRecipe(_buildRecipeWidgets()),
              ],
            ),
            )
        ],
      ),
    );
  }

  List<Widget> _buildRecipeWidgets() {
    List<Widget> recipeWidgets = [];
    for (int i = 0; i < 10; i++) {

    }
    return recipeWidgets;
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
  List<Widget> reciperows = [];
  for (int i = 0; i < recipeWidgets.length; i += 2) {
    reciperows.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          children: [
            Flexible(flex: 1, child: recipeWidgets[i]),
            SizedBox(width: 10), // Add some spacing between the buttons
            if (i + 1 < recipeWidgets.length)
              Flexible(flex: 1, child: recipeWidgets[i + 1]),
            if (i + 1 >= recipeWidgets.length)
              Flexible(flex: 1, child: SizedBox.shrink()), // Empty box for layout consistency
          ],
        ),
      ),
    );
  }
  return reciperows;
}
}

