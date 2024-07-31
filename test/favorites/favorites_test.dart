import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/favorites/favorites_controller_implementation.dart';
import 'package:simple_cook/ui/favorites/services/favorites_persistence_service.dart';
import 'favorites_test.mocks.dart';
import 'package:riverpod/riverpod.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks([FavoritesPersistenceService])
class RecipeFinderControllerTestMocks {}

void main() {
  late MockFavoritesPersistenceService mockPersistenceService;

  setUp(() async {
    mockPersistenceService = MockFavoritesPersistenceService();
  });

  FavoritesControllerImplementation createFavoritesController() {
    final FavoritesControllerImplementation favoritesController =
        ProviderContainer().read(
      FavoritesControllerImplementationProvider(
        persistenceService: mockPersistenceService,
      ).notifier,
    );
    final KeepAliveLink keepAliveLink = favoritesController.ref.keepAlive();
    addTearDown(keepAliveLink.close);
    return favoritesController;
  }

  final SingleRecipe recipe = SingleRecipe(
    imageUrls: ["https://image.brigitte.de/11739226/t/sf/v3/w1440/r1/-/bavette-mit-spargel-und-burrata-kaese.jpg"],
    ingredients: <Ingredient>[
      Ingredient(amount: "750", name: "grüner Spargel", unit: "Gramm"),
      Ingredient(amount: "30", name: "Haselnussblättchen", unit: "Gramm"),
      Ingredient(amount: "1", name: "Burrata", unit: "Kugel"),
    ],
    portions: 4,
    source: "https://www.brigitte.de/rezepte/bavette-mit-spargel-und-burrata-kaese-10553628.html",
    steps: <String>["Zuerst ..."],
    title: "Bavette mit Spargel und Burrata-Käse",
    totalTime: 1800.0);

group('FavoritesControllerImplementation Tests', () {
    test('loadFavorites sets state with favorite recipes', () async {
      List<SingleRecipe> mockFavorites = [];
      mockFavorites.add(recipe);
      when(mockPersistenceService.getFavoriteRecipes()).thenReturn(mockFavorites);

      final controller = createFavoritesController();

      await controller.loadFavorites();

      expect(controller.state.favoriteRecipes, equals(mockFavorites));
      verify(mockPersistenceService.getFavoriteRecipes()).called(1);
    });

    test('toggleFavorite adds a favorite if not already favorite', () async {
      when(mockPersistenceService.isFavorite(recipe)).thenReturn(false);
      when(mockPersistenceService.getFavoriteRecipes()).thenReturn([]);

      final controller = createFavoritesController();

      await controller.toggleFavorite(recipe);

      verify(mockPersistenceService.addFavorite(recipe)).called(1);
      verifyNever(mockPersistenceService.removeFavorite(recipe));
      verify(mockPersistenceService.getFavoriteRecipes()).called(1);
    });

    test('toggleFavorite removes a favorite if already favorite', () async {
      when(mockPersistenceService.isFavorite(recipe)).thenReturn(true);
      when(mockPersistenceService.getFavoriteRecipes()).thenReturn([recipe]);

      final controller = createFavoritesController();

      await controller.toggleFavorite(recipe);

      verify(mockPersistenceService.removeFavorite(recipe)).called(1);
      verifyNever(mockPersistenceService.addFavorite(recipe));
      verify(mockPersistenceService.getFavoriteRecipes()).called(1);
    });

    test('isFavorite returns true if recipe is favorite', () async {
      when(mockPersistenceService.isFavorite(recipe)).thenReturn(true);

      final controller = createFavoritesController();

      final result = controller.isFavorite(recipe);

      expect(result, isTrue);
      verify(mockPersistenceService.isFavorite(recipe)).called(1);
    });

    test('isFavorite returns false if recipe is not favorite', () async {
      when(mockPersistenceService.isFavorite(recipe)).thenReturn(false);

      final controller = createFavoritesController();

      final result = controller.isFavorite(recipe);

      expect(result, isFalse);
      verify(mockPersistenceService.isFavorite(recipe)).called(1);
    });
  });
}