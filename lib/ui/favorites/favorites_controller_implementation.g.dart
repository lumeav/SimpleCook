// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesControllerImplementationHash() =>
    r'51018aca96cef1b372b2bde43199a0689f02126d';

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

abstract class _$FavoritesControllerImplementation
    extends BuildlessAutoDisposeNotifier<FavoritesModel> {
  late final FavoritesPersistenceService persistenceService;

  FavoritesModel build({
    required FavoritesPersistenceService persistenceService,
  });
}

/// See also [FavoritesControllerImplementation].
@ProviderFor(FavoritesControllerImplementation)
const favoritesControllerImplementationProvider =
    FavoritesControllerImplementationFamily();

/// See also [FavoritesControllerImplementation].
class FavoritesControllerImplementationFamily extends Family<FavoritesModel> {
  /// See also [FavoritesControllerImplementation].
  const FavoritesControllerImplementationFamily();

  /// See also [FavoritesControllerImplementation].
  FavoritesControllerImplementationProvider call({
    required FavoritesPersistenceService persistenceService,
  }) {
    return FavoritesControllerImplementationProvider(
      persistenceService: persistenceService,
    );
  }

  @override
  FavoritesControllerImplementationProvider getProviderOverride(
    covariant FavoritesControllerImplementationProvider provider,
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
  String? get name => r'favoritesControllerImplementationProvider';
}

/// See also [FavoritesControllerImplementation].
class FavoritesControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<FavoritesControllerImplementation,
        FavoritesModel> {
  /// See also [FavoritesControllerImplementation].
  FavoritesControllerImplementationProvider({
    required FavoritesPersistenceService persistenceService,
  }) : this._internal(
          () => FavoritesControllerImplementation()
            ..persistenceService = persistenceService,
          from: favoritesControllerImplementationProvider,
          name: r'favoritesControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoritesControllerImplementationHash,
          dependencies: FavoritesControllerImplementationFamily._dependencies,
          allTransitiveDependencies: FavoritesControllerImplementationFamily
              ._allTransitiveDependencies,
          persistenceService: persistenceService,
        );

  FavoritesControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.persistenceService,
  }) : super.internal();

  final FavoritesPersistenceService persistenceService;

  @override
  FavoritesModel runNotifierBuild(
    covariant FavoritesControllerImplementation notifier,
  ) {
    return notifier.build(
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(FavoritesControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoritesControllerImplementationProvider._internal(
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
  AutoDisposeNotifierProviderElement<FavoritesControllerImplementation,
      FavoritesModel> createElement() {
    return _FavoritesControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoritesControllerImplementationProvider &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FavoritesControllerImplementationRef
    on AutoDisposeNotifierProviderRef<FavoritesModel> {
  /// The parameter `persistenceService` of this provider.
  FavoritesPersistenceService get persistenceService;
}

class _FavoritesControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<
        FavoritesControllerImplementation,
        FavoritesModel> with FavoritesControllerImplementationRef {
  _FavoritesControllerImplementationProviderElement(super.provider);

  @override
  FavoritesPersistenceService get persistenceService =>
      (origin as FavoritesControllerImplementationProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
