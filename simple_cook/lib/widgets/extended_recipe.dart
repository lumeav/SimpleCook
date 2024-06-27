import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExtendedRecipe extends StatefulWidget {
  final Widget header;
  final String imgPath;
  final String rezeptName;
  final String source;
  final String difficulty;


  const ExtendedRecipe(this.header, this.imgPath, this.rezeptName, this.source, this.difficulty,{super.key});

  @override
  State<ExtendedRecipe> createState() => _ExtendedRecipeState();
}

class _ExtendedRecipeState extends State<ExtendedRecipe> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Placeholder for future logic
        context.goNamed('subRecipeView', queryParameters: {'recipeUrl': widget.source, 'difficulty': widget.difficulty});
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
                          topRight: Radius.circular(12) // Set the desired border radius for the top left corner
                          ),
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: Image.network(
                            widget.imgPath,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    /*
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(true),
                    )
                    */
                  ]
                ),
                widget.header
              ],
            )),
      ),
    );
  }
}