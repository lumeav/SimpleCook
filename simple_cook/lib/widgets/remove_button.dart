import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class RemoveButton extends StatelessWidget {
  final SingleRecipe recipe;
  final Function(SingleRecipe) onPressed; // Adjusted to accept SingleRecipe
  const RemoveButton({
    required this.recipe,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => onPressed(recipe), // Pass recipe to onPressed callback
          icon: const FaIcon(
            FontAwesomeIcons.minus,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}