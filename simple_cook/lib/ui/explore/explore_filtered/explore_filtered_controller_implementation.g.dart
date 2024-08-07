// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_filtered_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exploreFilteredControllerImplementationHash() =>
    r'a43b9ddbee317d45ce1bdf277a98b2c9ea895824';

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

abstract class _$ExploreFilteredControllerImplementation
    extends BuildlessAutoDisposeNotifier<ExploreFilteredModel> {
  late final ExploreRecipeService recipeService;

  ExploreFilteredModel build({
    required ExploreRecipeService recipeService,
  });
}

/// See also [ExploreFilteredControllerImplementation].
@ProviderFor(ExploreFilteredControllerImplementation)
const exploreFilteredControllerImplementationProvider =
    ExploreFilteredControllerImplementationFamily();

/// See also [ExploreFilteredControllerImplementation].
class ExploreFilteredControllerImplementationFamily
    extends Family<ExploreFilteredModel> {
  /// See also [ExploreFilteredControllerImplementation].
  const ExploreFilteredControllerImplementationFamily();

  /// See also [ExploreFilteredControllerImplementation].
  ExploreFilteredControllerImplementationProvider call({
    required ExploreRecipeService recipeService,
  }) {
    return ExploreFilteredControllerImplementationProvider(
      recipeService: recipeService,
    );
  }

  @override
  ExploreFilteredControllerImplementationProvider getProviderOverride(
    covariant ExploreFilteredControllerImplementationProvider provider,
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
  String? get name => r'exploreFilteredControllerImplementationProvider';
}

/// See also [ExploreFilteredControllerImplementation].
class ExploreFilteredControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<
        ExploreFilteredControllerImplementation, ExploreFilteredModel> {
  /// See also [ExploreFilteredControllerImplementation].
  ExploreFilteredControllerImplementationProvider({
    required ExploreRecipeService recipeService,
  }) : this._internal(
          () => ExploreFilteredControllerImplementation()
            ..recipeService = recipeService,
          from: exploreFilteredControllerImplementationProvider,
          name: r'exploreFilteredControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exploreFilteredControllerImplementationHash,
          dependencies:
              ExploreFilteredControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              ExploreFilteredControllerImplementationFamily
                  ._allTransitiveDependencies,
          recipeService: recipeService,
        );

  ExploreFilteredControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeService,
  }) : super.internal();

  final ExploreRecipeService recipeService;

  @override
  ExploreFilteredModel runNotifierBuild(
    covariant ExploreFilteredControllerImplementation notifier,
  ) {
    return notifier.build(
      recipeService: recipeService,
    );
  }

  @override
  Override overrideWith(
      ExploreFilteredControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExploreFilteredControllerImplementationProvider._internal(
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
  AutoDisposeNotifierProviderElement<ExploreFilteredControllerImplementation,
      ExploreFilteredModel> createElement() {
    return _ExploreFilteredControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExploreFilteredControllerImplementationProvider &&
        other.recipeService == recipeService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExploreFilteredControllerImplementationRef
    on AutoDisposeNotifierProviderRef<ExploreFilteredModel> {
  /// The parameter `recipeService` of this provider.
  ExploreRecipeService get recipeService;
}

class _ExploreFilteredControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<
        ExploreFilteredControllerImplementation,
        ExploreFilteredModel> with ExploreFilteredControllerImplementationRef {
  _ExploreFilteredControllerImplementationProviderElement(super.provider);

  @override
  ExploreRecipeService get recipeService =>
      (origin as ExploreFilteredControllerImplementationProvider).recipeService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
