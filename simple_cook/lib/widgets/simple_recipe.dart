import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SimpleRecipe extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const SimpleRecipe(this.imgPath, this.rezeptName, {super.key});

  @override
  State<SimpleRecipe> createState() => _SimpleRecipeState();
}

class _SimpleRecipeState extends State<SimpleRecipe> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width * 0.6;
    return SizedBox(
      height: height,
      //margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          // Placeholder for future logic
          context.go('/recipeView');
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
                              12) // Set the desired border radius for the top left corner
                          ),
                      child: AspectRatio(
                        aspectRatio: 1.1,
                        child: Image.asset(
                          widget.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(true),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    widget.rezeptName,
                    style: SimpleCookTextstyles.subheader,
                    maxLines: 2,
                    minFontSize: 8,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
