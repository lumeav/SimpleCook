import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/persistence_service.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class FavoritesView extends ConsumerWidget {

  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persistenceService = PersistenceService();
    final favoriteRecipes = persistenceService.getFavoriteRecipes();

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
                  if (favoriteRecipes.isEmpty)
                    Center(
                      child: Text('No favorite recipes'),
                    )
                  else
                    _buildRowsRecipe(_buildRecipeWidgets(favoriteRecipes), scrollViewHeight),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

  List<Widget> _buildRecipeWidgets(List<SingleRecipe> recipes) {
  return recipes.map((recipe) {
    return SimpleRecipe(
      recipe.imageUrls.isNotEmpty ? recipe.imageUrls.first : '',
      recipe.title,
      recipe.source,
      '', // Add actual difficulty if available or leave it as an empty string
    );
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
        children: recipeWidgets,
      ),
    );
  }

