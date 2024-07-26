import 'package:simple_cook/ui/explore/services/explore_persistence_service.dart';
import 'package:simple_cook/ui/favorites/persistence_service/persistence_service_interface.dart';
import 'package:simple_cook/ui/planner/persistence_service/persistence_service_interface.dart';
import 'package:simple_cook/ui/recipe_finder/persistence_service/persistence_service_interface.dart';

abstract class PersistenceServiceAggregator
    implements ExplorePersistenceService, FavoritesPersistenceService, PlannerPersistenceService, SearchPersistenceService {
  PersistenceServiceAggregator();
}