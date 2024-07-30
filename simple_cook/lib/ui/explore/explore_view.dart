import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/widgets/header_rezept_des_tages.dart';
import 'package:simple_cook/common/widgets/extended_recipe.dart';
import 'package:simple_cook/ui/explore/widgets/search_bar_explore.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/common/widgets/simple_recipe.dart';
import 'package:simple_cook/common/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/common/theme.dart';
import 'explore_providers.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {

  @override
  void initState() {
    super.initState();
    ref.read(exploreControllerProvider).buildRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final ExploreModel exploreState = ref.watch(exploreModelProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[200],
        body: exploreState.fetchFinished
            ? CustomScrollView(slivers: <Widget>[
                const SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  toolbarHeight: 80,
                  title: Row(children: <Widget>[
                    Expanded(child: SearchBarExplore()),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      buildHeaderRecipeOfTheDay(exploreState.recipeOfTheDay!),
                      const HeaderGreyBackground(
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
                    children: <Widget>[
                      for (Recipe recipe in exploreState.recipes!)
                        SimpleRecipe(
                            recipe.imageUrls.first,
                            recipe.title,
                            recipe.source,
                            null),
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
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                          child: Text(exploreState.errorMessage!,
                              style: const TextStyle(color: Colors.grey)),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          exploreControllerProvider)
                                      .rebuildRecipes();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          SimpleCookColors.primary),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          color: SimpleCookColors.border,
                                          width: 1.5),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Erneut versuchen",
                                  style: SimpleCookTextstyles.filterTagTapped,
                                )))
                      ],
                    ),
                  )));
  }

  Widget buildHeaderRecipeOfTheDay(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0),
      child: ExtendedRecipe(
          HeaderRezeptDesTages(recipe.title),
          recipe.imageUrls.first,
          recipe.title,
          recipe.source,
          null),
    );
  }
}

abstract class ExploreController {
  Future<void> buildRecipes();
  Future<void> rebuildRecipes();
}
