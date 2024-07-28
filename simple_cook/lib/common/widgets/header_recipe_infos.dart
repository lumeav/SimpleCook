import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/widgets/recipe_infos.dart';

class HeaderRecipeInfos extends StatelessWidget {
  final String title;
  final String duration;

  const HeaderRecipeInfos(this.title, this.duration, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              title,
              style: SimpleCookTextstyles.header,
              maxLines: 2,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RecipeInfos(duration)),
        )
      ]),
    );
  }
}
