import 'package:flutter/material.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';

class RecipesFilteredView extends StatefulWidget {
  final String? search;

  const RecipesFilteredView({
    this.search,
    Key? key,
  }) : super(key: key);

  @override
  _RecipesTagViewState createState() => _RecipesTagViewState();
}

class _RecipesTagViewState extends State<RecipesFilteredView> {
  List<Recipe>? recipes;
  bool isSearching = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    print('search: ${widget.search}');
    buildRecipes(widget.search!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: isSearching
            ? CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: HeaderGreyBackground('Suchergebnisse für ${widget.search}', FontWeight.w300)),
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
                ],
              )
            : !error
                ? const Center(
                    child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  ))
                : const Center(child: Text('Error while loading recipes')));
  }

  Future<void> buildRecipes(String search) async {
    final recipeService = RecipeService();
    //recipes = await recipeService.getAllRecipes(search);
    ApiResponse<List<Recipe>?> response = await recipeService.getAllRecipes(search);
    if (response.data == null) {
      error = true;
    } else {
      recipes = response.data;
    }
    setState(() {
      isSearching = true;
    });
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
