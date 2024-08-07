// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_finder_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeFinderControllerImplementationHash() =>
    r'f5c56be5dbf9d4e93730f59ebe7f1466a93001c8';

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

abstract class _$RecipeFinderControllerImplementation
    extends BuildlessAutoDisposeNotifier<RecipeFinderModel> {
  late final RecipeFinderPersistenceService persistenceService;

  RecipeFinderModel build({
    required RecipeFinderPersistenceService persistenceService,
  });
}

/// See also [RecipeFinderControllerImplementation].
@ProviderFor(RecipeFinderControllerImplementation)
const recipeFinderControllerImplementationProvider =
    RecipeFinderControllerImplementationFamily();

/// See also [RecipeFinderControllerImplementation].
class RecipeFinderControllerImplementationFamily
    extends Family<RecipeFinderModel> {
  /// See also [RecipeFinderControllerImplementation].
  const RecipeFinderControllerImplementationFamily();

  /// See also [RecipeFinderControllerImplementation].
  RecipeFinderControllerImplementationProvider call({
    required RecipeFinderPersistenceService persistenceService,
  }) {
    return RecipeFinderControllerImplementationProvider(
      persistenceService: persistenceService,
    );
  }

  @override
  RecipeFinderControllerImplementationProvider getProviderOverride(
    covariant RecipeFinderControllerImplementationProvider provider,
  ) {
    return call(
      persistenceService: provider.persistenceService,
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
  String? get name => r'recipeFinderControllerImplementationProvider';
}

/// See also [RecipeFinderControllerImplementation].
class RecipeFinderControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<
        RecipeFinderControllerImplementation, RecipeFinderModel> {
  /// See also [RecipeFinderControllerImplementation].
  RecipeFinderControllerImplementationProvider({
    required RecipeFinderPersistenceService persistenceService,
  }) : this._internal(
          () => RecipeFinderControllerImplementation()
            ..persistenceService = persistenceService,
          from: recipeFinderControllerImplementationProvider,
          name: r'recipeFinderControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeFinderControllerImplementationHash,
          dependencies:
              RecipeFinderControllerImplementationFamily._dependencies,
          allTransitiveDependencies: RecipeFinderControllerImplementationFamily
              ._allTransitiveDependencies,
          persistenceService: persistenceService,
        );

  RecipeFinderControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.persistenceService,
  }) : super.internal();

  final RecipeFinderPersistenceService persistenceService;

  @override
  RecipeFinderModel runNotifierBuild(
    covariant RecipeFinderControllerImplementation notifier,
  ) {
    return notifier.build(
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(
      RecipeFinderControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeFinderControllerImplementationProvider._internal(
        () => create()..persistenceService = persistenceService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        persistenceService: persistenceService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RecipeFinderControllerImplementation,
      RecipeFinderModel> createElement() {
    return _RecipeFinderControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeFinderControllerImplementationProvider &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipeFinderControllerImplementationRef
    on AutoDisposeNotifierProviderRef<RecipeFinderModel> {
  /// The parameter `persistenceService` of this provider.
  RecipeFinderPersistenceService get persistenceService;
}

class _RecipeFinderControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<
        RecipeFinderControllerImplementation,
        RecipeFinderModel> with RecipeFinderControllerImplementationRef {
  _RecipeFinderControllerImplementationProviderElement(super.provider);

  @override
  RecipeFinderPersistenceService get persistenceService =>
      (origin as RecipeFinderControllerImplementationProvider)
          .persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
