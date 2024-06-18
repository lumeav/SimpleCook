import 'package:flutter/material.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/simpleRecipe.dart';
import 'package:simple_cook/widgets/headerGreyBackground.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_controller.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

class FavoritesView extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FavoritesView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoritesViewControllerProvider);

    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: Scrollbar(
        radius: Radius.circular(50),
        thickness: 5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderGreyBackground("Favoriten", FontWeight.bold),
              ElevatedButton(
              onPressed: () {
                ref.read(favoritesViewControllerProvider.notifier).addMockRecipe();
              },
              child: Text('Add Mock Recipe'),
            ),
              ..._buildRowsRecipe(_buildRecipeWidgets(favoriteRecipes)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  List<Widget> _buildRecipeWidgets(List<Recipe> recipes) {
    return recipes.map((recipe) {
      return SimpleRecipe(recipe.imagePath, recipe.title);
    }).toList();
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
    List<Widget> reciperows = [];
    for (int i = 0; i < recipeWidgets.length; i++) {
      reciperows.add(
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: recipeWidgets[i]),
              if (i + 1 < recipeWidgets.length) ...[
                SizedBox(width: 10),
                Expanded(flex: 2, child: recipeWidgets[i + 1]),
              ],
            ],
          ),
        ),
      );
      i++;
    }
    return reciperows;
  }
}