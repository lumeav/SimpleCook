import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:simple_cook/ui/favorites/favorites_controller_implementation.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';

part 'favorites_providers.g.dart';

@riverpod
FavoritesController favoritesController(final FavoritesControllerRef ref) => ref.watch(
  FavoritesControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
).notifier);

@riverpod
FavoritesModel favoritesModel(final FavoritesModelRef ref) => ref.watch(
  FavoritesControllerImplementationProvider(
    persistenceService: ref.watch(persistenceServiceProvider),
));