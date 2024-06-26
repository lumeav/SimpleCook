import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_cook/widgets/header_rezept_des_tages.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/search_bar_explore.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/common/theme.dart';
import 'dart:math';

class ExploreView extends StatefulWidget {
  const ExploreView({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  List<Recipe>? recipes;
  Recipe? recipeoftheday;
  bool isSearching = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    buildRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: isSearching
            ? CustomScrollView(slivers: [
                const SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  toolbarHeight: 80,
                  title: Row(children: [
                    Expanded(child: SearchBarExplore()),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      buildHeaderRecipeOfTheDay(recipeoftheday!),
                      HeaderGreyBackground('Entdecke neue Rezepte', FontWeight.w300),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10.0, bottom: 10.0),
                  sliver: SliverGrid.count(
                    childAspectRatio: 0.78,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      for (var recipe in recipes!)
                        SimpleRecipe(recipe.imageUrls.first, recipe.title,
                            recipe.source, checkDiff(recipe.difficulty)),
                    ],
                  ),
                )
              ])
            : !error
                ? const Center(
                    child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  ))
                : const Center(child: Text('Error while loading recipes')));
  }

  Future<void> buildRecipes() async {
    final recipeService = RecipeService();
    recipes = await recipeService.getAllRecipes('Hauptspeise');
    var random = Random();
    recipeoftheday = recipes![random.nextInt(recipes!.length)];
    if (recipes == null) {
      error = true;
    }
    setState(() {
      isSearching = true;
    });
  }

  Widget buildHeaderRecipeOfTheDay(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0),
      child: ExtendedRecipe(
          HeaderRezeptDesTages(recipe.title),
          recipe.imageUrls.first,
          recipe.title,
          recipe.source,
          checkDiff(recipe.difficulty)),
    );
  }

  String checkDiff(String? diff) {
    if (diff == 'easy') {
      return 'einfach';
    } else if (diff == 'medium') {
      return 'mittel';
    } else if (diff == 'hard') {
      return 'schwer';
    } else {
      return 'unbekannt';
    }
  }
}
