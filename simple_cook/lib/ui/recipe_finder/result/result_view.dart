import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/widgets/loading_indicator.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_controller_implementation.dart';
import 'package:simple_cook/common/theme.dart';

class ResultView extends ConsumerStatefulWidget {
  final String? text;

  const ResultView({Key? key, this.text}) : super(key: key);

  @override
  ConsumerState<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<ResultView> {

  @override
  void initState() {
    super.initState();
    print('text: ${widget.text}');
    ref.read(resultControllerImplementationProvider.notifier).fetchRecipe(widget.text!);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resultControllerImplementationProvider);

    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[200],
        body: state.isLoadRecipe
            ? Column(children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddPlaner(),
                        SizedBox(width: 10),
                        //HeartButton(false)
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
                            child: state.error
                                ? const Center(
                                    child: Text(
                                      'Error loading recipe',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  )
                                : buildRecipe(state.recipe!, state.url!)),
                      ),
                    ],
                  ),
                )),
              ])
            : LoadingIndicator());
  }

  Widget buildRecipe(GenRecipeModel recipe, String url) {
    return Column(
      children: [
        Stack(children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: AspectRatio(
                  aspectRatio: 1.8,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  )))
        ]),
        Column(
          children: [
            HeaderRecipeInfos(recipe.title,
                recipe.totalTime.toStringAsFixed(0), ''),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider()),
            Ingredients([
              for (var ingredient in recipe.ingredients)
                if (ingredient.amount == null && ingredient.unit == "")
                  ingredient.name
                else if (ingredient.amount != null && ingredient.unit == "")
                  if (ingredient.amount! % 1 == 0)
                    '${ingredient.amount!.toInt()} ${ingredient.name}'
                  else
                  '${ingredient.amount} ${ingredient.name}'
                else if (ingredient.amount != null && ingredient.unit != "")
                  if (ingredient.amount! % 1 == 0)
                    '${ingredient.amount!.toInt()} ${ingredient.unit} ${ingredient.name}'
                  else
                  '${ingredient.amount} ${ingredient.unit} ${ingredient.name}'
            ],
            recipe.portions),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Preparation([
                for (var preparation in recipe.instructions)
                  preparation.substring(preparation.indexOf(' ') + 1).trim()
              ]),
            )
          ],
        )
      ],
    );
  }
}

abstract class ResultController {
  void fetchRecipe(String query);
}