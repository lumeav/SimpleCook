// Mocks generated by Mockito 5.4.4 from annotations
// in simple_cook/test/recipe_info/recipe_info_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:simple_cook/service/recipe_service/api_response.dart' as _i2;
import 'package:simple_cook/service/recipe_service/recipe_gen_model.dart'
    as _i6;
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart'
    as _i5;
import 'package:simple_cook/ui/recipe_info/services/recipe_info_recipe_service.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiResponse_0<T> extends _i1.SmartFake
    implements _i2.ApiResponse<T> {
  _FakeApiResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RecipeInfoRecipeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecipeInfoRecipeService extends _i1.Mock
    implements _i3.RecipeInfoRecipeService {
  MockRecipeInfoRecipeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ApiResponse<_i5.SingleRecipe>> getSingleRecipe(
          String? recipeUrl) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingleRecipe,
          [recipeUrl],
        ),
        returnValue: _i4.Future<_i2.ApiResponse<_i5.SingleRecipe>>.value(
            _FakeApiResponse_0<_i5.SingleRecipe>(
          this,
          Invocation.method(
            #getSingleRecipe,
            [recipeUrl],
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse<_i5.SingleRecipe>>);

  @override
  _i4.Future<_i2.ApiResponse<String>> postGenRecipeModelImg(
          _i6.GenRecipeModel? genRecipe) =>
      (super.noSuchMethod(
        Invocation.method(
          #postGenRecipeModelImg,
          [genRecipe],
        ),
        returnValue: _i4.Future<_i2.ApiResponse<String>>.value(
            _FakeApiResponse_0<String>(
          this,
          Invocation.method(
            #postGenRecipeModelImg,
            [genRecipe],
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse<String>>);

  @override
  _i4.Future<_i2.ApiResponse<_i6.GenRecipeModel>> postGenRecipeModel(
          String? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #postGenRecipeModel,
          [request],
        ),
        returnValue: _i4.Future<_i2.ApiResponse<_i6.GenRecipeModel>>.value(
            _FakeApiResponse_0<_i6.GenRecipeModel>(
          this,
          Invocation.method(
            #postGenRecipeModel,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse<_i6.GenRecipeModel>>);
}
