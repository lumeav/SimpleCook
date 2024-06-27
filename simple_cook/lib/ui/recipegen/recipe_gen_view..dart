import 'package:flutter/material.dart';
import 'package:simple_cook/service/recipe_service/gen_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_service.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/common/theme.dart';

class RecipeGenView extends StatefulWidget {
  final String? text;

  const RecipeGenView({Key? key, this.text}) : super(key: key);

  @override
  _RecipeGenViewState createState() => _RecipeGenViewState();
}

class _RecipeGenViewState extends State<RecipeGenView> {
  GenRecipe? recipe;
  String? url;
  bool isLoadingRecipe = false;
  bool isLoadingImg = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    print('text: ${widget.text}');
    getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[200],
        body: !error
            ? Column(children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddPlaner(),
                        SizedBox(width: 10),
                        HeartButton(false)
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
                            child: buildRecipe()),
                      ),
                    ],
                  ),
                )),
              ])
            : const Center(child: Text('Error while loading recipe')));
  }

  void getRecipe() async {
    final service = RecipeService();
    recipe = await service.postGenRecipe(widget.text!);
    if (recipe == null) {
      print('error');
      error = true;
    }
    getRecipeImg(recipe!);
    setState(() {
      isLoadingRecipe = true;
    });
  }

  void getRecipeImg(GenRecipe genRecipe) async {
    final service = RecipeService();
    url = await service.postGenRecipeImg(genRecipe);
    if (url == null) {
      print('error');
      error = true;
    }
    setState(() {
      isLoadingImg = true;
    });
  }

  Widget buildRecipe() {
    return Column(
      children: [
        Stack(children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: isLoadingImg
                  ? AspectRatio(
                      aspectRatio: 1.8,
                      child: Image.network(
                        url!,
                        fit: BoxFit.cover,
                      ))
                  : const AspectRatio(
                          aspectRatio: 1.8,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  SimpleCookColors.primary))),
                    )
        ]),
        isLoadingRecipe
            ? Column(
                children: [
                  HeaderRecipeInfos(recipe!.title,
                      recipe!.totalTime.toStringAsFixed(0), 'unbekannt'),
                  const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider()),
                  Ingredients([
                    for (var ingredient in recipe!.ingredients)
                      if (ingredient.amount == null && ingredient.unit == "")
                        ingredient.name
                      else if (ingredient.amount != null && ingredient.unit == "")
                        '${ingredient.amount} ${ingredient.name}'
                      else
                        '${ingredient.amount} ${ingredient.unit} ${ingredient.name}'
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Preparation([
                      for (var preparation in recipe!.instructions)
                        preparation
                            .substring(preparation.indexOf(' ') + 1)
                            .trim()
                    ]),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        SimpleCookColors.primary)))
      ],
    );
  }
}
