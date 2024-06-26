import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/widgets/header_rezept_des_tages.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/ui/explore/widgets/search_bar_explore.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/ui/favorites/favorites_provider.dart';
import 'package:simple_cook/common/theme.dart';
import 'explore_controller_implementation.dart';
import 'dart:math';
//import 'package:simple_cook/ui/favorites/favorites_provider.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {


  @override
  void initState() {
    super.initState();
    //buildRecipes();
    ref.read(exploreControllerImplementationProvider.notifier).buildRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final exploreState = ref.watch(exploreControllerImplementationProvider);
    ref.watch(favoritesProvider); // watch if Recipe gets added to Favorites

    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: exploreState.isSearching
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
                      buildHeaderRecipeOfTheDay(exploreState.recipeOfTheDay!),
                      HeaderGreyBackground(
                          'Entdecke neue Rezepte', FontWeight.w300),
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
                      for (var recipe in exploreState.recipes!)
                        SimpleRecipe(
                            recipe.imageUrls.first,
                            recipe.title,
                            recipe.source,
                            ref
                                .read(exploreControllerImplementationProvider.notifier)
                                .checkDiff(recipe.difficulty)),
                    ],
                  ),
                )
              ])
            : !exploreState.error
                ? const Center(
                    child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  ))
                : const Center(
                    child: Text(
                        'Error while loading recipes, check for connection')));
  }

  Widget buildHeaderRecipeOfTheDay(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0),
      child: ExtendedRecipe(
          HeaderRezeptDesTages(recipe.title),
          recipe.imageUrls.first,
          recipe.title,
          recipe.source,
          ref
              .read(exploreControllerImplementationProvider.notifier)
              .checkDiff(recipe.difficulty)),
    );
  }
}

abstract class ExploreController {
  Future<void> buildRecipes();
  String checkDiff(String? diff);
    //void goToFilteredRecipesView({required final String query}); // Todo: reimplement with NavigationService
}
