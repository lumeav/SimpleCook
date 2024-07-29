import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';

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
        // Placeholder for future logic
        context.pushNamed('singleRecipeView', queryParameters: {'recipeUrl': widget.source}, extra: widget.genRecipe);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)
                          ),
                        child: AspectRatio(
                          aspectRatio: 1.9,
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