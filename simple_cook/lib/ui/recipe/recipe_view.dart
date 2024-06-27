import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/favorites/favorites_provider.dart';

class RecipeView extends ConsumerStatefulWidget {
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

class _RecipeViewState extends ConsumerState<RecipeView> {
  SingleRecipe? recipe;
  bool isSearching = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    buildRecipe();
  }

  @override
  Widget build(BuildContext context) {
    //ref.watch(favoritesProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
        backgroundColor: Colors.grey[200],
        body: isSearching
            ? Column(children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (recipe != null) ...[
                          AddPlaner(recipe: recipe!),
                          const SizedBox(width: 10),
                          //error:_Map<dynamic, dynamic>' is not a subtype of type 'Map<String, dynamic>
                          //so we copy with empty ingredients for now. Doesnt matter because we build it again in buildSingleRecipe
                          //only works with internet connection
                          HeartButton(false, recipe: copyWithEmptyIngredients(recipe!)), 
                        ],
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
                            child: buildSingleRecipe(recipe!, widget.recipeUrl!,
                                widget.difficulty!)),
                      ),
                    ],
                  ),
                )),
              ])
            : !error
                ? const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            SimpleCookColors.primary)))
                : const Center(child: Text('Error while loading recipe')));
  }

  Future<void> buildRecipe() async {
    final RecipeService service = RecipeService();
    recipe = await service.getSingleRecipe(widget.recipeUrl!);
    if (recipe == null) {
      error = true;
    }
    setState(() {
      isSearching = true;
    });
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
                  singleRecipe.image_urls.first,
                  fit: BoxFit.cover,
                )),
          )
        ]),
        HeaderRecipeInfos(singleRecipe.title,
            singleRecipe.totalTime.toStringAsFixed(0), difficulty!),
        const Padding(
            padding: EdgeInsets.only(left: 15, right: 15), child: Divider()),
        Ingredients([
          for (var ingredient in singleRecipe.ingredients)
            if (ingredient.amount == "" && ingredient.unit == "")
              ingredient.name
            else if (ingredient.amount != "" && ingredient.unit == "")
              '${ingredient.amount} ${ingredient.name}'
            else
              '${ingredient.amount} ${ingredient.unit} ${ingredient.name}'
        ]),
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
      image_urls: recipe.image_urls,
      ingredients: [], // Empty ingredients list
      portions: recipe.portions,
      source: recipe.source,
      steps: recipe.steps,
      title: recipe.title,
      totalTime: recipe.totalTime,
    );
  }
}
