import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/constants.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/common/widgets/loading_indicator.dart';
import 'package:simple_cook/common/widgets/simple_recipe.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service/recipes_model.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_model.dart';
import 'explore_filtered_providers.dart';

class ExploreFilteredView extends ConsumerStatefulWidget {
  final String? search;

  const ExploreFilteredView({
    this.search,
    super.key,
  });

  @override
  ConsumerState<ExploreFilteredView> createState() =>
      _ExploreFilteredViewState();
}

class _ExploreFilteredViewState extends ConsumerState<ExploreFilteredView> {
  @override
  void initState() {
    super.initState();
    print('search: ${widget.search}');
    ref
        .read(exploreFilteredControllerProvider)
        .buildRecipes(widget.search!);
  }

  @override
  Widget build(BuildContext context) {
    final ExploreFilteredModel exploreFilteredState =
        ref.watch(exploreFilteredModelProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'),
        backgroundColor: SimpleCookColors.backgroundColor,
        body: exploreFilteredState.fetchFinished
            ? CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: HeaderGreyBackground(
                          'Suchergebnisse für ${widget.search}',
                          FontWeight.w300)),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10.0, bottom: 10.0),
                    sliver: SliverGrid.count(
                      childAspectRatio: SimpleCookRatios.recipeGridRatio,
                      crossAxisCount: SimpleCookConstants.recipeGridCount,
                      mainAxisSpacing: SimpleCookConstants.recipeGridMainSpacing,
                      crossAxisSpacing: SimpleCookConstants.recipeGridCrossSpacing,
                      children: <Widget>[
                        for (Recipe recipe in exploreFilteredState.filteredRecipes!)
                          SimpleRecipe(
                              recipe.imageUrls.first,
                              recipe.title,
                              recipe.source,
                              null
                    ),],
                    ),
                  )
                ],
              )
            : !exploreFilteredState.error
                ? const Center(
                    child: LoadingIndicator())
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(exploreFilteredState.errorMessage!,
                            style: SimpleCookTextstyles.error),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          exploreFilteredControllerProvider)
                                      .rebuildRecipes(widget.search!);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          SimpleCookColors.primary),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          SimpleCookColors.secondary),
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
}

abstract class ExploreFilteredController {
  Future<void> buildRecipes(String search);
  Future<void> rebuildRecipes(String search);
}
