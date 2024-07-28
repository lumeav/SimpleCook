import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/favorites/favorites_providers.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';

class HeartButton extends ConsumerWidget {
  final bool border;
  final SingleRecipe recipe;

  const HeartButton(this.border, {required this.recipe, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FavoritesController favoritesController = ref.watch(favoritesControllerProvider);
    final bool isFavorite = favoritesController.isFavorite(recipe);
    ref.watch(favoritesModelProvider);

    void onPressed() {
      favoritesController.toggleFavorite(recipe);
    }

    double size = MediaQuery.of(context).size.width * 0.07;
    if (!border) {
      size = size + 12;
    }
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: border
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
