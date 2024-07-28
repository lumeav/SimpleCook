// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$plannerControllerImplementationHash() =>
    r'f44c1dae7adf6911fa5c4b3be0a06c1ddba1d5a1';

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

abstract class _$PlannerControllerImplementation
    extends BuildlessAutoDisposeNotifier<PlannerModel> {
  late final PlannerPersistenceService persistenceService;

  PlannerModel build({
    required PlannerPersistenceService persistenceService,
  });
}

/// See also [PlannerControllerImplementation].
@ProviderFor(PlannerControllerImplementation)
const plannerControllerImplementationProvider =
    PlannerControllerImplementationFamily();

/// See also [PlannerControllerImplementation].
class PlannerControllerImplementationFamily extends Family<PlannerModel> {
  /// See also [PlannerControllerImplementation].
  const PlannerControllerImplementationFamily();

  /// See also [PlannerControllerImplementation].
  PlannerControllerImplementationProvider call({
    required PlannerPersistenceService persistenceService,
  }) {
    return PlannerControllerImplementationProvider(
      persistenceService: persistenceService,
    );
  }

  @override
  PlannerControllerImplementationProvider getProviderOverride(
    covariant PlannerControllerImplementationProvider provider,
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
  String? get name => r'plannerControllerImplementationProvider';
}

/// See also [PlannerControllerImplementation].
class PlannerControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<PlannerControllerImplementation,
        PlannerModel> {
  /// See also [PlannerControllerImplementation].
  PlannerControllerImplementationProvider({
    required PlannerPersistenceService persistenceService,
  }) : this._internal(
          () => PlannerControllerImplementation()
            ..persistenceService = persistenceService,
          from: plannerControllerImplementationProvider,
          name: r'plannerControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$plannerControllerImplementationHash,
          dependencies: PlannerControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              PlannerControllerImplementationFamily._allTransitiveDependencies,
          persistenceService: persistenceService,
        );

  PlannerControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.persistenceService,
  }) : super.internal();

  final PlannerPersistenceService persistenceService;

  @override
  PlannerModel runNotifierBuild(
    covariant PlannerControllerImplementation notifier,
  ) {
    return notifier.build(
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(PlannerControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlannerControllerImplementationProvider._internal(
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
  AutoDisposeNotifierProviderElement<PlannerControllerImplementation,
      PlannerModel> createElement() {
    return _PlannerControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlannerControllerImplementationProvider &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlannerControllerImplementationRef
    on AutoDisposeNotifierProviderRef<PlannerModel> {
  /// The parameter `persistenceService` of this provider.
  PlannerPersistenceService get persistenceService;
}

class _PlannerControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<PlannerControllerImplementation,
        PlannerModel> with PlannerControllerImplementationRef {
  _PlannerControllerImplementationProviderElement(super.provider);

  @override
  PlannerPersistenceService get persistenceService =>
      (origin as PlannerControllerImplementationProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
