import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/RezeptdesTages.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';

class GreyBackground extends StatelessWidget { // Todo: Sollte doch Stateful sein?
  final List<Widget> recipes;

  const GreyBackground(this.recipes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          radius: Radius.circular(50),
          thickness: 5,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                // Light grey background color
                padding: EdgeInsets.all(16.0),
                //color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildRecipeWidgets(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildRecipeWidgets() {
    List<Widget> recipeWidgets = [];
    for (int i = 0; i < recipes.length; i++) {
      if (i < recipes.length - 1 && recipes[i] is SingleRecipeButton && recipes[i + 1] is SingleRecipeButton) {
        // If the current and next widget are both SingleRecipeButtons, put them in a Row
        recipeWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Expanded(flex: 3,child: recipes[i]),
                SizedBox(width: 8), // Add some spacing between the buttons
                Expanded(flex: 3, child: recipes[i + 1]),
              ],
            ),
          ),
        );
        i++; // Skip the next widget as it has already been added to the Row
      } else {
        // Otherwise, just add the widget normally
        recipeWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: recipes[i],
          ),
        );
      }
    }
    return recipeWidgets;
  }
}
