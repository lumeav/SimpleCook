import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_controller_implementation.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/ui/recipe_finder/widgets/filter_tag.dart';
import 'package:simple_cook/widgets/slider_filter.dart';
import 'package:simple_cook/ui/recipe_finder/widgets/search_bar.dart';
import 'package:simple_cook/widgets/search_recipe_button.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';

class RecipefinderView extends ConsumerStatefulWidget {


  RecipefinderView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<RecipefinderView> createState() => _RecipefinderViewState();
}

class _RecipefinderViewState extends ConsumerState<RecipefinderView> {

  @override
  Widget build(BuildContext context) {
    final recipeFinderState = ref.watch(recipeFinderControllerImplementationProvider);
    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: Container(
          child: Scrollbar(
            radius: const Radius.circular(50),
            thickness: 5,
            child: SingleChildScrollView(
              physics:  ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SearchBarFilter(),
                  const HeaderGreyBackground("Kategorie", FontWeight.bold),
                  _buildFilterTags(recipeFinderState.categories),
                  const HeaderGreyBackground("Ernährungsart", FontWeight.bold), // HeaderGreyBackground("Ernährungsart"
                  _buildFilterTags(recipeFinderState.diets),
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 30),
                    alignment: Alignment.center,
                    child: const SearchRecipesButton("Rezept generieren", "subRecipesFiltered")

                  )
                ],
              ),
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
            //crossAxisAlignment: WrapCrossAlignment.end,
            runAlignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 10.0, // Space between tags
            runSpacing: 5.0, // Space between lines
            children: [
              for (var filter in filterList) FilterTag(filter),
            ],
          )),
    );
  }
}

abstract class RecipeFinderController {
  void setFilterActive(String filter);
  void setFilterInactive(String filter);
  String getFilter();
}


