import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_model.dart';
import 'package:simple_cook/common/widgets/loading_indicator.dart';
import 'package:simple_cook/common/widgets/preparation.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/common/widgets/heart_button.dart';
import 'package:simple_cook/common/widgets/add_planer.dart';
import 'package:simple_cook/common/widgets/ingredients.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/common/widgets/header_recipe_infos.dart';
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
    final RecipeInfoModel recipeInfoState = ref.watch(recipeInfoControllerImplementationProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'),
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
                          HeartButton(false, recipe: recipeInfoState.recipe!),
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
            singleRecipe.totalTime.toStringAsFixed(0)),
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
}

abstract class RecipeInfoController {
  Future<void> fetchRecipe(String? recipeUrl);
  Future<void> refetchRecipe(String? recipeUrl);
}
