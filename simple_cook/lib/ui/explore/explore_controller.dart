import 'package:flutter/material.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/service/recipes_model.dart';


class ExploreController {
  final RecipeService recipeService = RecipeService();

  Widget buildRecipes() {
  return FutureBuilder(
      future: recipeService.getAllRecipes('Tomate'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
              )));
        } else {
          final recipes = snapshot.data;
          if (recipes == null) {
            return const SliverToBoxAdapter(child: Text('No recipes found'));
          }
          return SliverPadding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10.0, bottom: 10.0),
            sliver: SliverGrid.count(
              childAspectRatio: 0.78,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                for (var recipe in recipes)
                  SimpleRecipe(recipe.imageUrls.first, recipe.title, recipe.source, recipe.difficulty!),
              ],
            ),
          );
        }
      });
}


}