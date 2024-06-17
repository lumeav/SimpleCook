import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';
import 'package:simple_cook/widgets/filtertag.dart';

class HeaderWochenPlaner extends StatelessWidget {
  final String title;
  final String duration;
  final String difficulty;

  const HeaderWochenPlaner(this.title, this.duration, this.difficulty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
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
