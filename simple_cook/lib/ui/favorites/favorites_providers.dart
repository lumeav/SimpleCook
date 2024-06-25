import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/ui/favorites/favorites_model.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/favorites/favorites_controller.dart';
import 'package:simple_cook/service/persistence/implementation/persistence_service.dart';

part 'favorites_providers.g.dart';


@riverpod
FavoritesController favoritesController(final FavoritesControllerRef ref) => ref.watch(
  favoritesControllerImplementationProvider(
    // navigationService: ref.watch(goRouterNavigationServiceProvider), ==> Eventuell GoRouter als Service implementieren
    persistenceService: ref.watch(persistenceServiceProvider)
  ).notifier,
);

@riverpod
FavoritesModel favoritesModel(final FavoritesModelRef ref) => ref.watch(
  favoritesControllerImplementationProvider(
    // navigationService: ref.watch(goRouterNavigationServiceProvider), ==> Eventuell GoRouter als Service implementieren
    persistenceService: ref.watch(persistenceServiceProvider)
  ),
);