import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/widgets/roundedIconButton.dart';

class RecipePortion extends StatefulWidget {

  const RecipePortion({super.key});

  @override
  State<RecipePortion> createState() => _RecipePortionState();
}

class _RecipePortionState extends State<RecipePortion> {
  int portionSize = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIconButton(
          size: 20,
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
            style: SimpleCookTextstyles.portions,
          ),
        ),
        RoundedIconButton(
          size: 20,
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
    );
  }
}
