import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/recipe_portion.dart';

class Ingredients extends StatefulWidget {
  final List<String> ingredientList;
  final int portion;
  const Ingredients(this.ingredientList, this.portion, {super.key});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  Widget _buildBulletItem(String text, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 16.0),
        Expanded(child: Text(text, style: SimpleCookTextstyles.rawText)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Zutaten",
                style: SimpleCookTextstyles.subheader
              ),
              Text(
                widget.portion.toString() + " Port.",
                style: SimpleCookTextstyles.portions
              ),
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children:
              List.generate(widget.ingredientList.length, (index) {
                return _buildBulletItem(widget.ingredientList[index], index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
