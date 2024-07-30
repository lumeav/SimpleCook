// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeInfoControllerImplementationHash() =>
    r'9d07887426ae46e114c037d144ce85ffc29f0a11';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RecipeInfoControllerImplementation
    extends BuildlessAutoDisposeNotifier<RecipeInfoModel> {
  late final RecipeInfoRecipeService recipeService;

  RecipeInfoModel build({
    required RecipeInfoRecipeService recipeService,
  });
}

/// See also [RecipeInfoControllerImplementation].
@ProviderFor(RecipeInfoControllerImplementation)
const recipeInfoControllerImplementationProvider =
    RecipeInfoControllerImplementationFamily();

/// See also [RecipeInfoControllerImplementation].
class RecipeInfoControllerImplementationFamily extends Family<RecipeInfoModel> {
  /// See also [RecipeInfoControllerImplementation].
  const RecipeInfoControllerImplementationFamily();

  /// See also [RecipeInfoControllerImplementation].
  RecipeInfoControllerImplementationProvider call({
    required RecipeInfoRecipeService recipeService,
  }) {
    return RecipeInfoControllerImplementationProvider(
      recipeService: recipeService,
    );
  }

  @override
  RecipeInfoControllerImplementationProvider getProviderOverride(
    covariant RecipeInfoControllerImplementationProvider provider,
  ) {
    return call(
      recipeService: provider.recipeService,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeInfoControllerImplementationProvider';
}

/// See also [RecipeInfoControllerImplementation].
class RecipeInfoControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<RecipeInfoControllerImplementation,
        RecipeInfoModel> {
  /// See also [RecipeInfoControllerImplementation].
  RecipeInfoControllerImplementationProvider({
    required RecipeInfoRecipeService recipeService,
  }) : this._internal(
          () => RecipeInfoControllerImplementation()
            ..recipeService = recipeService,
          from: recipeInfoControllerImplementationProvider,
          name: r'recipeInfoControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeInfoControllerImplementationHash,
          dependencies: RecipeInfoControllerImplementationFamily._dependencies,
          allTransitiveDependencies: RecipeInfoControllerImplementationFamily
              ._allTransitiveDependencies,
          recipeService: recipeService,
        );

  RecipeInfoControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeService,
  }) : super.internal();

  final RecipeInfoRecipeService recipeService;

  @override
  RecipeInfoModel runNotifierBuild(
    covariant RecipeInfoControllerImplementation notifier,
  ) {
    return notifier.build(
      recipeService: recipeService,
    );
  }

  @override
  Override overrideWith(RecipeInfoControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeInfoControllerImplementationProvider._internal(
        () => create()..recipeService = recipeService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeService: recipeService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RecipeInfoControllerImplementation,
      RecipeInfoModel> createElement() {
    return _RecipeInfoControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeInfoControllerImplementationProvider &&
        other.recipeService == recipeService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipeInfoControllerImplementationRef
    on AutoDisposeNotifierProviderRef<RecipeInfoModel> {
  /// The parameter `recipeService` of this provider.
  RecipeInfoRecipeService get recipeService;
}

class _RecipeInfoControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<
        RecipeInfoControllerImplementation,
        RecipeInfoModel> with RecipeInfoControllerImplementationRef {
  _RecipeInfoControllerImplementationProviderElement(super.provider);

  @override
  RecipeInfoRecipeService get recipeService =>
      (origin as RecipeInfoControllerImplementationProvider).recipeService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
