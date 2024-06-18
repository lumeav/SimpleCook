import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/recipePortion.dart';

class Ingredients extends StatefulWidget {
  final List<String> ingredientList;
  const Ingredients(this.ingredientList, {Key? key}) : super(key: key);

  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  Widget _buildBulletItem(String text, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('•', style: TextStyle(fontSize: 20)),
        SizedBox(width: 16.0),
        Expanded(child: Text(text, style: TextStyle(fontSize: 18))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Zutaten",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
            RecipePortion()
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
