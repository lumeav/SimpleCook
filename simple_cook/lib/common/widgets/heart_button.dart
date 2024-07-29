import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/favorites/favorites_providers.dart';

class HeartButton extends ConsumerStatefulWidget {
  final bool border;
  final SingleRecipe? recipe;

  const HeartButton(this.border, {required this.recipe, super.key});

  @override
  ConsumerState<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends ConsumerState<HeartButton> {

  @override
  Widget build(BuildContext context) {
    final favoritesController = ref.watch(favoritesControllerProvider);
    final bool isFavorite = favoritesController.isFavorite(widget.recipe!);
    ref.watch(favoritesModelProvider);

    void onPressed() {
      favoritesController.toggleFavorite(widget.recipe!);
    }

    var size = MediaQuery.of(context).size.width * 0.07;
    if (!widget.border) {
      size = size + 12;
    }
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: widget.border
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
          : null,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            color: SimpleCookColors.primary, size: size),
      ),
    );
  }
}
