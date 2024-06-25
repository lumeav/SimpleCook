import 'package:flutter/material.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';
import 'package:simple_cook/ui/favorites/favorites_providers.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerWidget {

  const FavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //ref.watch(favoritesModelProvider.select((final FavoritesModel value) => value.recipes),); // If recipes changes, reload the widget
    final favorites = ref.watch(favoritesModelProvider); // watch if the state of the Favorites model changes (recipes getting added)

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
                  },
                  child: Text('Add Mock Recipe'),
                ),
                  // build the Recipes from the recipe list here
                  _buildRowsRecipe(_buildRecipeWidgets(favorites.recipes, ref), scrollViewHeight),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

abstract class FavoritesController {
  void addRecipe(Recipe recipe);
  void removeRecipe(Recipe recipe);
  void showRecipe();
}

List<Widget> _buildRecipeWidgets(List<Recipe> recipes, WidgetRef ref) {
  final favoritesController = ref.read(favoritesControllerProvider);
  return recipes.map((recipe) {
    return SimpleRecipe(recipe.imageUrls.first, recipe.title, recipe.source, recipe.difficulty!);
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
