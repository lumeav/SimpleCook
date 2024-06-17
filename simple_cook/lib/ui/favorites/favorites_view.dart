import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/rezeptdesTages.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';
import 'package:simple_cook/widgets/headerGreyBackground.dart';

class FavoritesView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FavoritesView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Scrollbar(
        radius: Radius.circular(50),
        thickness: 5,
        child: SingleChildScrollView(
          child:  Column (
            children: [
              HeaderGreyBackground("Favoriten", FontWeight.bold),
              ..._buildRowsRecipe(_buildRecipeWidgets()),
            ],
          ),)),
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
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen hello das ist ein langer text'),
      );
    }
    return recipeWidgets;
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
    List<Widget> reciperows = [];
    for (int i = 0; i < recipeWidgets.length; i++) {
        reciperows.add(
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(flex: 2,child: recipeWidgets[i]),
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
