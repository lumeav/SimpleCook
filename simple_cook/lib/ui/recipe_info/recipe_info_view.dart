import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_controller_implementation.dart';
import 'package:simple_cook/widgets/loading_indicator.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/common/theme.dart';

class RecipeView extends ConsumerStatefulWidget {
  final String? recipeUrl;
  final String? difficulty;

  const RecipeView({
    super.key,
    this.recipeUrl,
    this.difficulty,
  });

  @override
  ConsumerState<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends ConsumerState<RecipeView> {

  @override
  void initState() {
    super.initState();
    ref.read(recipeInfoControllerImplementationProvider.notifier).fetchRecipe(widget.recipeUrl);
  }

  @override
  Widget build(BuildContext context) {
    final recipeInfoState = ref.watch(recipeInfoControllerImplementationProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: recipeInfoState.fetchFinished
            ? Column(children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          AddPlaner(recipe: recipeInfoState.recipe),
                          const SizedBox(width: 10),
                          //error:_Map<dynamic, dynamic>' is not a subtype of type 'Map<String, dynamic>
                          //so we copy with empty ingredients for now. Doesnt matter because we build it again in buildSingleRecipe
                          //only works with internet connection
                          HeartButton(false, recipe: copyWithEmptyIngredients(recipeInfoState.recipe!)),
                      ],
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: buildSingleRecipe(recipeInfoState.recipe!, widget.recipeUrl!,
                                widget.difficulty!)),
                      ),
                    ],
                  ),
                )),
              ])
            : recipeInfoState.error
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(recipeInfoState.errorMessage!,
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          recipeInfoControllerImplementationProvider
                                              .notifier)
                                      .refetchRecipe(widget.recipeUrl);
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
                                  "Try again",
                                  style: SimpleCookTextstyles.filterTagTapped,
                                )))
                      ],
                    ),
                  ))
                : LoadingIndicator());
  }

  Widget buildSingleRecipe(
      SingleRecipe singleRecipe, String recipeUrl, String difficulty) {
    return Column(
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: AspectRatio(
                aspectRatio: 1.8,
                child: Image.network(
                  singleRecipe.imageUrls.first,
                  fit: BoxFit.cover,
                )),
          )
        ]),
        HeaderRecipeInfos(singleRecipe.title,
            singleRecipe.totalTime.toStringAsFixed(0), difficulty),
        const Padding(
            padding: EdgeInsets.only(left: 15, right: 15), child: Divider()),
        Ingredients([
          for (var ingredient in singleRecipe.ingredients)
            if (ingredient.amount == "" && ingredient.unit == "")
              ingredient.name
            else if (ingredient.amount != "" && ingredient.unit == "")
              '${ingredient.amount} ${ingredient.name}'
            else if (ingredient.amount == "" && ingredient.unit != "")
              '${ingredient.unit} ${ingredient.name}'
            else if (ingredient.amount != "" && ingredient.unit != "")
              '${ingredient.amount} ${ingredient.unit} ${ingredient.name}'
        ],
        singleRecipe.portions),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Preparation(
              [for (var preparation in singleRecipe.steps) preparation]),
        )
      ],
    );
  }

  SingleRecipe copyWithEmptyIngredients(SingleRecipe recipe) {
    return SingleRecipe(
      diet: recipe.diet,
      imageUrls: recipe.imageUrls,
      ingredients: [], // Empty ingredients list
      portions: recipe.portions,
      source: recipe.source,
      steps: recipe.steps,
      title: recipe.title,
      totalTime: recipe.totalTime,
    );
  }
}

abstract class RecipeInfoController {
  Future<void> fetchRecipe(String? recipeUrl);
  Future<void> refetchRecipe(String? recipeUrl);
}
