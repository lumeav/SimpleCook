import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/common/theme.dart';

class RecipeView extends StatefulWidget {
  final String? recipeUrl;
  final String? difficulty;

  const RecipeView({
    Key? key,
    this.recipeUrl,
    this.difficulty,
  }) : super(key: key);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final service = RecipeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AddPlaner(), SizedBox(width: 10), HeartButton(false)],
            )),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: buildSingleRecipe(
                        service, widget.recipeUrl!, widget.difficulty!)),
              ),
            ],
          ),
        )),
      ]),
    );
  }
}

Widget buildSingleRecipe(
    RecipeService service, String recipeUrl, String difficulty) {
  return FutureBuilder(
      future: service.getSingleRecipe(recipeUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  ));
        } else {
          print('hello');
          print(snapshot);
          final singleRecipe = snapshot.data as SingleRecipe?;
          if (singleRecipe == null) {
            return const Text('No data found');
          }
          print(singleRecipe);

          return Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: AspectRatio(
                      aspectRatio: 1.8,
                      child: Image.network(
                        singleRecipe.imageUrls.first,
                        fit: BoxFit.cover,
                      )),
                )
              ]),
              HeaderRecipeInfos(singleRecipe.title,
                  singleRecipe.totalTime.toStringAsFixed(0), difficulty!),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider()),
              Ingredients([
                for (var ingredient in singleRecipe.ingredients)
                  ingredient.amount +
                      ' ' +
                      ingredient.unit +
                      ' ' +
                      ingredient.name
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Preparation(
                    [for (var preparation in singleRecipe.steps) preparation]),
              )
            ],
          );
        }
      });
}
