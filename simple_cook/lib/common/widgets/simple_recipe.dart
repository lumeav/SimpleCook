import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/widgets/heart_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

class SimpleRecipe extends StatefulWidget {
  final String imgPath;
  final String rezeptName;
  final String source;
  final String difficulty;

  const SimpleRecipe(
      this.imgPath, this.rezeptName, this.source, this.difficulty,
      {super.key});

  @override
  State<SimpleRecipe> createState() => _SimpleRecipeState();
}

class _SimpleRecipeState extends State<SimpleRecipe> {
  @override
  Widget build(BuildContext context) {
    final SingleRecipe recipe = SingleRecipe(
      diet: [],
      imageUrls: [widget.imgPath],
      ingredients: [],
      portions: 1,
      source: widget.source,
      steps: [],
      title: widget.rezeptName,
      totalTime: 0.0,
    );
    return Container(
      child: InkWell(
        onTap: () {
          context.pushNamed('singleRecipeView', queryParameters: {'recipeUrl': widget.source, 'difficulty': widget.difficulty});
        },
        child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(
                              12)
                          ),
                      child: AspectRatio(
                        aspectRatio: 1.1,
                        child:
                            Image.network(widget.imgPath!, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(
                        true,
                        recipe: recipe,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    widget.rezeptName!,
                    style: SimpleCookTextstyles.recheader,
                    maxLines: 2,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}