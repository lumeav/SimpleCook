import 'package:flutter/material.dart';
import 'package:simple_cook/common/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/simple_recipe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_provider.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorite recipes'))
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return SimpleRecipe(
                  recipe.imageUrls.isNotEmpty ? recipe.imageUrls.first : '',
                  recipe.title,
                  recipe.source,
                  '', // Add actual difficulty if available or leave it as an empty string
                );
              },
            ),
    );
  }
}
