import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/planner/planner_provider.dart';

class RemoveButton extends ConsumerWidget {
  final SingleRecipe recipe;
  final String date; // Adjusted to accept SingleRecipe
  const RemoveButton({
    required this.recipe,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannP = ref.watch(plannerProvider.notifier);
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
          onPressed: () => plannP.removePlanner(date, recipe), // Pass recipe to onPressed callback
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