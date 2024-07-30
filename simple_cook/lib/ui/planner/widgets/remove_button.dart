import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/planner/planner_providers.dart';

class RemoveButton extends ConsumerWidget {
  final SingleRecipe recipe;
  final String date;
  const RemoveButton({
    required this.recipe,
    required this.date,
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlannerController controller = ref.watch(plannerControllerProvider);
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: SimpleCookColors.border,
          width: 3,
        ),
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => controller.removePlanner(date, recipe),
          icon: const FaIcon(
            FontAwesomeIcons.minus,
            color: SimpleCookColors.border,
            size: 20,
          ),
        ),
      ),
    );
  }
}