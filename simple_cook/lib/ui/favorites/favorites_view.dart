import 'package:flutter/material.dart';
import 'package:simple_cook/common/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/common/widgets/header_grey_background.dart';
import 'package:simple_cook/common/widgets/simple_recipe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_providers.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() => ref.read(favoritesControllerProvider).loadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    final favoriteModel = ref.watch(favoritesModelProvider);

    return Scaffold(
      appBar: const SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[200],
      body: favoriteModel.favoriteRecipes.isEmpty
          ? const Center(child: Text('Keine Favoriten hinzugefügt'))
          : Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.grey[200],
                child: const HeaderGreyBackground('Favoriten', FontWeight.bold)),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: favoriteModel.favoriteRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = favoriteModel.favoriteRecipes[index];
                      return SimpleRecipe(
                        recipe.imageUrls.isNotEmpty ? recipe.imageUrls.first : '',
                        recipe.title,
                        recipe.source!,
                        '', // Add actual difficulty if available or leave it as an empty string
                      );
                    },
                  ),
              ),
            ],
          ),
    );
  }
}

abstract class FavoritesController {
  Future<void> loadFavorites();
  bool isFavorite(SingleRecipe recipe);
  Future<void> toggleFavorite(SingleRecipe recipe);
}