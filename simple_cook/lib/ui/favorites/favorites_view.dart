import 'package:flutter/material.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_controller.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

class FavoritesView extends ConsumerWidget {

  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoritesControllerProvider);

    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scrollViewHeight = constraints.maxHeight;
          return Scrollbar(
            radius: Radius.circular(50),
            thickness: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderGreyBackground("Favoriten", FontWeight.bold),
                  ElevatedButton(
                  onPressed: () {
                    ref.read(favoritesControllerProvider.notifier).addMockRecipe();
                  },
                  child: Text('Add Mock Recipe'),
                ),
                  _buildRowsRecipe(_buildRecipeWidgets(favoriteRecipes), scrollViewHeight),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  List<Widget> _buildRecipeWidgets(List<Recipe> recipes) {
    return recipes.map((recipe) {
      return SimpleRecipe(recipe.imagePath, recipe.title);
    }).toList();
  }

  Widget _buildRowsRecipe(List<Widget> recipeWidgets, double height) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(15),
      child: GridView.count(
        childAspectRatio: 0.78,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          for (var recipe in recipeWidgets) recipe,
        ],
        ),
    );

  }
}