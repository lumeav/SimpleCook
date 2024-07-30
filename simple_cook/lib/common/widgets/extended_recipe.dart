import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/common/constants.dart';
import 'package:simple_cook/common/theme.dart';

class ExtendedRecipe extends StatefulWidget {
  final Widget header;
  final String imgPath;
  final String rezeptName;
  final String source;
  final SingleRecipe? genRecipe;


  const ExtendedRecipe(this.header, this.imgPath, this.rezeptName, this.source, this.genRecipe,{super.key});

  @override
  State<ExtendedRecipe> createState() => _ExtendedRecipeState();
}

class _ExtendedRecipeState extends State<ExtendedRecipe> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed('singleRecipeView', queryParameters: <String, dynamic>{'recipeUrl': widget.source}, extra: widget.genRecipe);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: SimpleCookColors.secondary),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)
                          ),
                        child: AspectRatio(
                          aspectRatio: SimpleCookRatios.extendedRecipeRatio,
                          child: Image.network(
                            widget.imgPath,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ]
                ),
                widget.header,
              ],
            )),
      ),
    );
  }
}