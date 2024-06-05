import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/img.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';

class WochenplanerRecipe extends StatefulWidget {
  final String imgPath;
  final String rezeptName;
  final String time;
  final String difficulty;

  const WochenplanerRecipe(this.imgPath, this.rezeptName, this.time, this.difficulty, {Key? key}) : super(key: key);

  @override
  _WochenplanerRecipeState createState() => _WochenplanerRecipeState();
}

class _WochenplanerRecipeState extends State<WochenplanerRecipe> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Placeholder for future logic
        print('Recipe tapped!');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Ink(
            width: 352,
            height: 262,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Img(widget.imgPath, 352, 170),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  child: Text(widget.rezeptName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                        )
                      ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: RecipeInfos(widget.time, widget.difficulty),
                )
              ],
            )),
      ),
    );
  }
}