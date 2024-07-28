import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:simple_cook/common/widgets/loading_indicator.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/common/widgets/header_recipe_infos.dart';
import 'package:simple_cook/common/widgets/ingredients.dart';
import 'package:simple_cook/common/widgets/preparation.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_model.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_providers.dart';
import 'package:simple_cook/common/theme.dart';

class ResultView extends ConsumerStatefulWidget {
  final String? text;

  const ResultView({super.key, this.text});

  @override
  ConsumerState<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<ResultView> {
  @override
  void initState() {
    super.initState();
    print('text: ${widget.text}');
    ref
        .read(resultControllerProvider)
        .fetchRecipe(widget.text!);
  }

  @override
  Widget build(BuildContext context) {
    final ResultModel resultState = ref.watch(resultModelProvider);

    return Scaffold(
        appBar: const SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[200],
        body: resultState.fetchFinished
            ? Column(children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 10),
                      ],
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: buildRecipe(resultState.recipe!, resultState.url!)),
                      ),
                    ],
                  ),
                )),
              ])
            : resultState.error
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                          child: Text(resultState.errorMessage!,
                              style: const TextStyle(color: Colors.grey)),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          resultControllerProvider)
                                      .refetchRecipe(widget.text!);
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
                                  "Erneut versuchen",
                                  style: SimpleCookTextstyles.filterTagTapped,
                                )))
                      ],
                    ),
                  ))
                : const LoadingIndicator(showTips: true));
  }

  Widget buildRecipe(GenRecipeModel recipe, String url) {
    return Column(
      children: <Widget>[
        Stack(children: <Widget>[
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
          children: <Widget>[
            HeaderRecipeInfos(recipe.title,
                recipe.totalTime.toStringAsFixed(0)),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider()),
            Ingredients(<String>[
              for (Ingredient ingredient in recipe.ingredients)
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
            ], recipe.portions),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Preparation(<String>[
                for (String preparation in recipe.instructions)
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
  Future<void> fetchRecipe(String query);
  Future<void> refetchRecipe(String query);
}
