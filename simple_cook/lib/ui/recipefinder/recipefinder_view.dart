import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/filter_tag.dart';
import 'package:simple_cook/widgets/slider_filter.dart';
import 'package:simple_cook/widgets/search_bar.dart';
import 'package:simple_cook/widgets/search_recipe_button.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service.dart';


class RecipefinderView extends StatefulWidget {


  RecipefinderView({
    Key? key,
  }) : super(key: key);

  @override
  _RecipefinderViewState createState() => _RecipefinderViewState();
}

class _RecipefinderViewState extends State<RecipefinderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: Container(
          child: Scrollbar(
            radius: Radius.circular(50),
            thickness: 5,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  SearchBarFilter(),
                  HeaderGreyBackground("Kategorie", FontWeight.bold),
                  _buildFilterTags(kategorieList),
                 HeaderGreyBackground("Ernährungsart", FontWeight.bold), // HeaderGreyBackground("Ernährungsart"
                  _buildFilterTags(ernaehrungsartList),
                  HeaderGreyBackground("Zubereitungszeit", FontWeight.bold),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SliderFilter(),
                  ),
                  ElevatedButton(onPressed: () {
                    loadRecipes();
                  }, child: Text('Rezepte suchen')),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 30),
                    alignment: Alignment.center,
                    child: SearchRecipesButton("Rezepte suchen", "subRecipesFiltered")),

                ],
              ),
            ),
          ),
        ));
  }

  Future<void> loadRecipes() async {
    final recipeService = RecipeService();
    final singlerecipe = await recipeService.getSingleRecipe('https://www.lecker.de/deftiger-kuechenzauber-topf-83483.html');//getAllRecipes('Tomate', null, null);
    for (var recipe in singlerecipe!.ingredients!) {
      print(recipe);
    }
  }

  List<String> kategorieList = [
    'Alle',
    'Vorspeise',
    'Hauptspeise',
    'Dessert',
    'Snacks',
  ];

  List<String> ernaehrungsartList = [
    'Vegetarisch',
    'Vegan',
    'Glutenfrei',
    'Laktosefrei',
    'Low Carb',
  ];
  //maybe refactor methods to widgets

  Widget _buildFilterTags(List<String> filterList) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.symmetric(vertical: 10),
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


