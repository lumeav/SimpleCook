// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exploreControllerImplementationHash() =>
    r'bcb01d24bbef5d1bb64a16e916e65941dc9471c1';

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

abstract class _$ExploreControllerImplementation
    extends BuildlessAutoDisposeNotifier<ExploreModel> {
  late final ExplorePersistenceService persistenceService;
  late final ExploreRecipeService recipeService;

  ExploreModel build({
    required ExplorePersistenceService persistenceService,
    required ExploreRecipeService recipeService,
  });
}

/// See also [ExploreControllerImplementation].
@ProviderFor(ExploreControllerImplementation)
const exploreControllerImplementationProvider =
    ExploreControllerImplementationFamily();

/// See also [ExploreControllerImplementation].
class ExploreControllerImplementationFamily extends Family<ExploreModel> {
  /// See also [ExploreControllerImplementation].
  const ExploreControllerImplementationFamily();

  /// See also [ExploreControllerImplementation].
  ExploreControllerImplementationProvider call({
    required ExplorePersistenceService persistenceService,
    required ExploreRecipeService recipeService,
  }) {
    return ExploreControllerImplementationProvider(
      persistenceService: persistenceService,
      recipeService: recipeService,
    );
  }

  @override
  ExploreControllerImplementationProvider getProviderOverride(
    covariant ExploreControllerImplementationProvider provider,
  ) {
    return call(
      persistenceService: provider.persistenceService,
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
  String? get name => r'exploreControllerImplementationProvider';
}

/// See also [ExploreControllerImplementation].
class ExploreControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<ExploreControllerImplementation,
        ExploreModel> {
  /// See also [ExploreControllerImplementation].
  ExploreControllerImplementationProvider({
    required ExplorePersistenceService persistenceService,
    required ExploreRecipeService recipeService,
  }) : this._internal(
          () => ExploreControllerImplementation()
            ..persistenceService = persistenceService
            ..recipeService = recipeService,
          from: exploreControllerImplementationProvider,
          name: r'exploreControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exploreControllerImplementationHash,
          dependencies: ExploreControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              ExploreControllerImplementationFamily._allTransitiveDependencies,
          persistenceService: persistenceService,
          recipeService: recipeService,
        );

  ExploreControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.persistenceService,
    required this.recipeService,
  }) : super.internal();

  final ExplorePersistenceService persistenceService;
  final ExploreRecipeService recipeService;

  @override
  ExploreModel runNotifierBuild(
    covariant ExploreControllerImplementation notifier,
  ) {
    return notifier.build(
      persistenceService: persistenceService,
      recipeService: recipeService,
    );
  }

  @override
  Override overrideWith(ExploreControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExploreControllerImplementationProvider._internal(
        () => create()
          ..persistenceService = persistenceService
          ..recipeService = recipeService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        persistenceService: persistenceService,
        recipeService: recipeService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ExploreControllerImplementation,
      ExploreModel> createElement() {
    return _ExploreControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExploreControllerImplementationProvider &&
        other.persistenceService == persistenceService &&
        other.recipeService == recipeService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);
    hash = _SystemHash.combine(hash, recipeService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExploreControllerImplementationRef
    on AutoDisposeNotifierProviderRef<ExploreModel> {
  /// The parameter `persistenceService` of this provider.
  ExplorePersistenceService get persistenceService;

  /// The parameter `recipeService` of this provider.
  ExploreRecipeService get recipeService;
}

class _ExploreControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<ExploreControllerImplementation,
        ExploreModel> with ExploreControllerImplementationRef {
  _ExploreControllerImplementationProviderElement(super.provider);

  @override
  ExplorePersistenceService get persistenceService =>
      (origin as ExploreControllerImplementationProvider).persistenceService;
  @override
  ExploreRecipeService get recipeService =>
      (origin as ExploreControllerImplementationProvider).recipeService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
