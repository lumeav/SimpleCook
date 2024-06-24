import 'package:flutter/material.dart';
import 'package:simple_cook/ui/explore/explore_controller.dart';
import 'package:simple_cook/widgets/header_rezept_des_tages.dart';
import 'package:simple_cook/widgets/extended_recipe.dart';
import 'package:simple_cook/widgets/search_bar_explore.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:simple_cook/widgets/header_grey_background.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/service/recipes_model.dart';
import 'package:simple_cook/common/theme.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final service = RecipeService();

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
          buildRecipes(service)
        ]));
  }
}

Widget buildRecipes(RecipeService recipeService) {
  return FutureBuilder(
      future: recipeService.getAllRecipes('Tomate'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  )));
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Text('No data found'));
        }
        else {
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
                  SimpleRecipe(recipe.imageUrls.first, recipe.title, recipe.source, checkDiff(recipe.difficulty)),
              ],
            ),
          );
        }
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



