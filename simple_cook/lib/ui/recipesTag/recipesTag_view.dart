import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/headerRezeptdesTages.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/extendedRecipe.dart';
import 'package:simple_cook/widgets/searchBarExplore.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/simpleRecipe.dart';
import 'package:simple_cook/widgets/filterButton.dart';
import 'package:simple_cook/widgets/headerGreyBackground.dart';


class RecipesTagView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const RecipesTagView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped
  }) : super(key: key);

  @override
  _RecipesTagViewState createState() => _RecipesTagViewState();
}

class _RecipesTagViewState extends State<RecipesTagView> {
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
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }

  List<Widget> _buildRecipeWidgets() {
    List<Widget> recipeWidgets = [];
    for (int i = 0; i < 10; i++) {
      recipeWidgets.add(
        SimpleRecipe('assets/flammkuchen.jpg',
            'Flammkuchen hello das ist ein langer text'),
      );
    }
    return recipeWidgets;
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
    List<Widget> reciperows = [];
    for (int i = 0; i < recipeWidgets.length; i++) {
      reciperows.add(
        Padding(
          padding: const EdgeInsets.only(
              left: 15, right: 15, top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: recipeWidgets[i]),
              SizedBox(width: 10), // Add some spacing between the buttons
              Expanded(flex: 2, child: recipeWidgets[i + 1]),
            ],
          ),
        ),
      );
      i++;
    }
    return reciperows;
  }
}
