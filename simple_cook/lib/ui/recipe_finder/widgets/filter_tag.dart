import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_providers.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';


class FilterTag extends ConsumerStatefulWidget {
  final String text;

  const FilterTag(
    this.text, {
    super.key,
  });

  @override
  ConsumerState<FilterTag> createState() => _FilterTagState();
}

class _FilterTagState extends ConsumerState<FilterTag> {
  bool _pressed = false;

  void _onPressed(RecipeFinderController recipeFinderProvider) {
    setState(() {
      _pressed = !_pressed;
    });
    if (_pressed) {
      recipeFinderProvider.setFilterActive(widget.text);
    } else {
      recipeFinderProvider.setFilterInactive(widget.text);
      // Placeholder for future logic
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipeFinderController = ref.watch(recipeFinderControllerProvider);
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: _pressed
          ? ElevatedButton.icon(
              onPressed: () => _onPressed(recipeFinderController),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                backgroundColor: SimpleCookColors.primary.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: SimpleCookColors.border,
                    width: 1.5,
                  ),
                ),
              ),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              label: Text(
                widget.text,
                style: SimpleCookTextstyles.filterTagTapped,
              ),
            )
          : ElevatedButton(
              onPressed: () => _onPressed(recipeFinderController),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: SimpleCookColors.border,
                    width: 1.5,
                  ),
                ),
              ),
              child: Text(
                widget.text,
                style: SimpleCookTextstyles.filterTagUntapped,
              ),
            ),
    );
  }
}
