import 'package:flutter/material.dart';

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
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.ingredientList.length,
        itemBuilder: (context, index) {
          return _buildBulletItem(widget.ingredientList[index], index);
        },
      );
  }
}