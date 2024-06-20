import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/widgets/heart_button.dart';

class ExtendedRecipe extends StatefulWidget {
  final String imgPath;
  final Widget header;


  const ExtendedRecipe(this.imgPath, this.header, {super.key});

  @override
  State<ExtendedRecipe> createState() => _ExtendedRecipeState();
}

class _ExtendedRecipeState extends State<ExtendedRecipe> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Placeholder for future logic
        context.go('/recipeView');
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
                          child: Image.asset(
                            widget.imgPath,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(true),
                    )
                  ]
                ),
                widget.header
              ],
            )),
      ),
    );
  }
}