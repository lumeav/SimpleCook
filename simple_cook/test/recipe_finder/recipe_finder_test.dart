import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_finder/services/recipe_finder_persistence_service.dart';
import 'recipe_finder_test.mocks.dart';
import 'package:riverpod/riverpod.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks(<Type>[RecipeFinderPersistenceService])
class RecipeFinderControllerTestMocks {}

void main() {
  late MockRecipeFinderPersistenceService mockPersistenceService;

  setUp(() async {
    // Initialisiere Mocks
    mockPersistenceService = MockRecipeFinderPersistenceService();
  });

  RecipeFinderControllerImplementation createRecipeFinderController() {
    final RecipeFinderControllerImplementation recipeFinderController =
        ProviderContainer().read(
      RecipeFinderControllerImplementationProvider(
        persistenceService: mockPersistenceService,
      ).notifier,
    );
    final KeepAliveLink keepAliveLink = recipeFinderController.ref.keepAlive();
    addTearDown(keepAliveLink.close);
    return recipeFinderController;
  }

  group('RecipeFinderControllerImplementation Tests', () {
    
    test('should add filter to activeFilters', () {

      final RecipeFinderControllerImplementation controller = createRecipeFinderController();
      
      const String filterName = 'Laktosefrei';

      controller.setFilterActive(filterName);

      expect(controller.state.activeFilters, contains(filterName));
    });

    test('should remove filter from activeFilters', () {

      final RecipeFinderControllerImplementation controller = createRecipeFinderController();

      const String filterName = 'Vegan';

      controller.setFilterActive(filterName);

      controller.setFilterInactive(filterName);

      expect(controller.state.activeFilters, isNot(contains(filterName)));
    });

    test('should get combined filter string', () {

      final RecipeFinderControllerImplementation controller = createRecipeFinderController();

      const String filter1 = 'Alle';
      const String filter2 = 'Vegetarisch';
      controller.setFilterActive(filter1);
      controller.setFilterActive(filter2);

      final String result = controller.getFilter();

      expect(result, '$filter1 $filter2');
    });

    test('should load search box history', () async {
      // Arrange
      final List<String> searchHistory = <String>['Pizza', 'Pasta'];
      when(mockPersistenceService.getSearchBox()).thenReturn(searchHistory);

      final List<String> result = await createRecipeFinderController().loadSearchBox();

      expect(result, searchHistory);
    });

    test('should add search query', () async {

      const String query = 'Tomate';

      await createRecipeFinderController().addSearchQuery(query);

      verify(mockPersistenceService.addToSearchBox(query)).called(1);
    });

    test('should perform search', () async {

      const String query = 'Burger';
      final Iterable<String> searchResults = <String>['Majoran'];
      when(mockPersistenceService.search(query)).thenAnswer((_) async => searchResults);

      final Iterable<String> result = await createRecipeFinderController().search(query);

      expect(result, searchResults);
    });
  });
}