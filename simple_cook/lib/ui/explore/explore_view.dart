import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/header_rezept_des_tages.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/search_bar_explore.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_cook/widgets/filter_tag.dart';
import 'package:simple_cook/widgets/slider_filter.dart';
import 'package:simple_cook/widgets/search_recipe_button.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/service/recipes_model.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final recipeService = RecipeService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(slivers: [
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
                const Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10.0, bottom: 10.0),
                  child: ExtendedRecipe('assets/flammkuchen.jpg',
                      HeaderRezeptDesTages('Flammmkuchen')),
                ),
                HeaderGreyBackground('Entdecke neue Rezepte', FontWeight.w300),
              ],
            ),
          ),
          buildList(recipeService)
        ]));
  }
}

Widget buildList(RecipeService recipeService) {
  return FutureBuilder(
      future: recipeService.getAllRecipes('Tomate'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: CircularProgressIndicator());
        } else {
          final recipes = snapshot.data as List<Recipe>?;
          if (recipes == null) {
            return SliverToBoxAdapter(child: Text('No recipes found'));
          }
          return SliverPadding(
            padding:
                EdgeInsets.only(left: 15, right: 15, top: 10.0, bottom: 10.0),
            sliver: SliverGrid.count(
              childAspectRatio: 0.78,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                for (var recipe in recipes)
                  SimpleRecipe(recipe.imageUrls.first, recipe.title),
              ],
            ),
          );
        }
      });
}
