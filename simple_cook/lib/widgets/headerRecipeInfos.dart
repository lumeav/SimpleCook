import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';

class HeaderRecipeInfos extends StatelessWidget {
  final String title;
  final String duration;
  final String difficulty;

  const HeaderRecipeInfos(this.title, this.duration, this.difficulty, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: SimpleCookTextstyles.header),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RecipeInfos(duration, difficulty)),
        )
      ]),
    );
  }
}
