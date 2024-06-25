import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_cook/service/persistence/persistence_service_aggregator.dart';
import 'package:simple_cook/ui/favorites/services/favorites_persistence_service.dart';

part 'persistence_service.g.dart';

@Riverpod(keepAlive: true)
PersistenceServiceAggregator persistenceService(
  final PersistenceServiceRef ref,
) => PersistenceService(
  // database: ref.watch(sharedPrefDatabaseProvider) // Todo: Datenbank hier einbinden!!!
);

class PersistenceService extends PersistenceServiceAggregator {

  @override
  FavoritesPersistenceServiceFavorites favorites() {
    // TODO: implement favorites
    throw UnimplementedError();
  }

  @override
  Future<void> loadFavoriteRecipes() {
    // TODO: implement loadFavoriteRecipes
    throw UnimplementedError();
  }

  // ... sollte in etwa wie folgt aussehen:
  //@override
  //Future<void> loadFavoriteRecipes() async {
    //final List<Recipe> recipes = database.readFavoriteRecipes();
  //}

}