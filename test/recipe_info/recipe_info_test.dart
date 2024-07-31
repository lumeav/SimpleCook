import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_controller_implementation.dart';
import 'package:simple_cook/ui/recipe_info/services/recipe_info_recipe_service.dart';
import 'package:simple_cook/service/recipe_service/api_response.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mockito/annotations.dart';

import 'recipe_info_test.mocks.dart';

@GenerateMocks(<Type>[RecipeInfoRecipeService])
class RecipeInfoControllerTestMocks {}

void main() {
  late MockRecipeInfoRecipeService mockRecipeService;

  setUp(() async {
    mockRecipeService = MockRecipeInfoRecipeService();
  });

  RecipeInfoControllerImplementation createRecipeInfoController() {
    final RecipeInfoControllerImplementation recipeInfoController =
        ProviderContainer().read(
      RecipeInfoControllerImplementationProvider(
              recipeService: mockRecipeService)
          .notifier,
    );
    final KeepAliveLink keepAliveLink = recipeInfoController.ref.keepAlive();
    addTearDown(keepAliveLink.close);
    return recipeInfoController;
  }

  group('RecipeInfoControllerImplementation Tests', () {
    test('should fetch recipe successfully', () async {
      final SingleRecipe singleRecipe = SingleRecipe(
        imageUrls: <String>['https://example.com/image.jpg'],
        ingredients: <Ingredient>[
          Ingredient(amount: '500', name: 'Flour', unit: 'grams'),
          Ingredient(amount: '200', name: 'Sugar', unit: 'grams'),
        ],
        portions: 4,
        source: 'https://example.com/recipe',
        steps: <String>['Mix ingredients', 'Bake for 20 minutes'],
        title: 'Sample Recipe',
        totalTime: 1200.0,
      );

      final ApiResponse<SingleRecipe> apiResponse =
          ApiResponse<SingleRecipe>(data: singleRecipe);
      when(mockRecipeService.getSingleRecipe(any)).thenAnswer(
        (_) async => apiResponse,
      );

      final RecipeInfoControllerImplementation controller =
          createRecipeInfoController();
      await controller.fetchRecipe('some-recipe-url');

      expect(controller.state.recipe, singleRecipe);
      expect(controller.state.error, isFalse);
      expect(controller.state.fetchFinished, isTrue);
    });

    test('should handle API error when fetching recipe', () async {
      final ApiResponse<SingleRecipe> apiResponse =
          ApiResponse<SingleRecipe>(errorMessage: 'Error occurred');
      when(mockRecipeService.getSingleRecipe(any)).thenAnswer(
        (_) async => apiResponse,
      );

      final RecipeInfoControllerImplementation controller =
          createRecipeInfoController();
      await controller.fetchRecipe('some-recipe-url');

      expect(controller.state.recipe, isNull);
      expect(controller.state.error, isTrue);
      expect(controller.state.errorMessage, 'Error occurred');
    });

    test('should handle API error when fetching generated recipe', () async {
      final ApiResponse<GenRecipeModel> genRecipeResponse =
          ApiResponse<GenRecipeModel>(errorMessage: 'Error occurred');

      when(mockRecipeService.postGenRecipeModel(any)).thenAnswer(
        (_) async => genRecipeResponse,
      );

      final RecipeInfoControllerImplementation controller =
          createRecipeInfoController();
      await controller.fetchGenRecipe('some-query');

      expect(controller.state.recipe, isNull);
      expect(controller.state.error, isTrue);
      expect(controller.state.errorMessage, 'Error occurred');
    });

    test('should retrieve ingredients correctly', () {
      final SingleRecipe singleRecipe = SingleRecipe(
        imageUrls: <String>['https://example.com/image.jpg'],
        ingredients: <Ingredient>[
          Ingredient(amount: '500', name: 'Flour', unit: 'grams'),
          Ingredient(amount: '200', name: 'Sugar', unit: 'grams'),
        ],
        portions: 4,
        source: 'https://example.com/recipe',
        steps: <String>['Mix ingredients', 'Bake for 20 minutes'],
        title: 'Sample Recipe',
        totalTime: 1200.0,
      );

      final RecipeInfoControllerImplementation controller =
          createRecipeInfoController();

      final List<String> ingredients =
          controller.retrieveIngredients(singleRecipe);

      expect(ingredients, <String>[
        '500 grams Flour',
        '200 grams Sugar',
      ]);
    });
  });
  group('GenIngredient Tests', () {
    test('should create GenIngredient with all properties', () {
      final GenIngredient ingredient = GenIngredient(
        name: 'Sugar',
        amount: 200.0,
        unit: 'grams',
      );

      expect(ingredient.name, 'Sugar');
      expect(ingredient.amount, 200.0);
      expect(ingredient.unit, 'grams');
    });

    test('should create GenIngredient with default properties', () {
      final GenIngredient ingredient = GenIngredient(name: 'Salt');

      expect(ingredient.name, 'Salt');
      expect(ingredient.amount, isNull);
      expect(ingredient.unit, isNull);
    });

    test('should compare two GenIngredient objects with same properties', () {
      final GenIngredient ingredient1 = GenIngredient(
        name: 'Sugar',
        amount: 200.0,
        unit: 'grams',
      );
      final GenIngredient ingredient2 = GenIngredient(
        name: 'Sugar',
        amount: 200.0,
        unit: 'grams',
      );

      expect(ingredient1, ingredient2);
    });

    test('should compare two GenIngredient objects with different properties',
        () {
      final GenIngredient ingredient1 = GenIngredient(
        name: 'Sugar',
        amount: 200.0,
        unit: 'grams',
      );
      final GenIngredient ingredient2 = GenIngredient(
        name: 'Salt',
        amount: 200.0,
        unit: 'grams',
      );

      expect(ingredient1, isNot(equals(ingredient2)));
    });
  });
}
