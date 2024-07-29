import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_model.dart';
import 'package:simple_cook/ui/recipe_finder/widgets/filter_tag.dart';
import 'package:simple_cook/ui/recipe_finder/widgets/search_bar.dart';
import 'package:simple_cook/ui/recipe_finder/widgets/search_recipe_button.dart';
import 'package:simple_cook/common/widgets/header_grey_background.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_providers.dart';

class RecipefinderView extends ConsumerStatefulWidget {

  const RecipefinderView({
    super.key,
  });

  @override
  ConsumerState<RecipefinderView> createState() => _RecipefinderViewState();
}

class _RecipefinderViewState extends ConsumerState<RecipefinderView> {

  @override
  Widget build(BuildContext context) {
    final RecipeFinderModel recipeFinderState = ref.watch(recipeFinderModelProvider);
    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[200],
        body: Scrollbar(
          radius: const Radius.circular(50),
          thickness: 5,
          child: SingleChildScrollView(
            physics:  const ClampingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const SearchBarFilter(),
                const HeaderGreyBackground("Kategorie", FontWeight.bold),
                _buildFilterTags(recipeFinderState.categories),
                const HeaderGreyBackground("Ernährungsart", FontWeight.bold),
                _buildFilterTags(recipeFinderState.diets),
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 30),
                  alignment: Alignment.center,
                  child: const SearchRecipesButton("Rezept generieren", "subRecipesFiltered")
        
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildFilterTags(List<String> filterList) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 5.0,
            children: <Widget>[
              for (String filter in filterList) FilterTag(filter),
            ],
          )),
    );
  }
}

abstract class RecipeFinderController {
  void setFilterActive(String filter);
  void setFilterInactive(String filter);
  String getFilter();
  Future<List<String>> loadSearchBox();
  Future<void> addSearchQuery(String query);
  Future<Iterable<String>> search(String query);
}


