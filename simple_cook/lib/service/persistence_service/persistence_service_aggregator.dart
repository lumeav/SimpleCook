import 'package:simple_cook/ui/explore/services/explore_persistence_service.dart';
import 'package:simple_cook/ui/favorites/persistence_service/persistence_service_interface.dart';
import 'package:simple_cook/ui/planner/services/planner_persistence_service.dart';
import 'package:simple_cook/ui/recipe_finder/services/recipe_finder_persistence_service.dart';

abstract class PersistenceServiceAggregator
    implements ExplorePersistenceService, FavoritesPersistenceService, PlannerPersistenceService, RecipeFinderPersistenceService {
  PersistenceServiceAggregator();
}