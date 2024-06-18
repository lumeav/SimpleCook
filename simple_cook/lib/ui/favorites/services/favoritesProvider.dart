import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';

//not used by an file so far, usable for later use, perhaps a global recipeProvider not only limited to favorites

final favoritesProvider = StateProvider<List<Recipe>>((ref) => [
  Recipe('assets/flammkuchen.jpg', 'Flammkuchen'),
  Recipe('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
  Recipe('assets/tinga-de-pollo.jpg', 'Tinga de Pollo'),
]);