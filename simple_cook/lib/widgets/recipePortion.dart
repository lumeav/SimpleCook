import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/roundedIconButton.dart';

class RecipePortion extends StatefulWidget {

  const RecipePortion({Key? key}) : super(key: key);

  @override
  _RecipePortionState createState() => _RecipePortionState();
}

class _RecipePortionState extends State<RecipePortion> {
  int portionSize = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedIconButton(
            size: 30,
            icon: Icons.remove,
            onPress: () {
              setState(() {
                if (portionSize == 0) {
                  return;
                }
                portionSize--;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${portionSize} Port.',
              style: const TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          RoundedIconButton(
            size: 30,
            icon: Icons.add,
            onPress: () {
              setState(() {
                if (portionSize == 10) {
                  return;
                }
                portionSize++;
              });
            },
          ),
        ],
      ),
    );
  }
}
