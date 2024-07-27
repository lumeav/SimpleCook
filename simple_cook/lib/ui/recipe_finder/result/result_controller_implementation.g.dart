// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_controller_implementation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultControllerImplementationHash() =>
    r'9db50967d19607316f49930faddb92d9426636ba';

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

abstract class _$ResultControllerImplementation
    extends BuildlessAutoDisposeNotifier<ResultModel> {
  late final ResultRecipeService recipeService;

  ResultModel build({
    required ResultRecipeService recipeService,
  });
}

/// See also [ResultControllerImplementation].
@ProviderFor(ResultControllerImplementation)
const resultControllerImplementationProvider =
    ResultControllerImplementationFamily();

/// See also [ResultControllerImplementation].
class ResultControllerImplementationFamily extends Family<ResultModel> {
  /// See also [ResultControllerImplementation].
  const ResultControllerImplementationFamily();

  /// See also [ResultControllerImplementation].
  ResultControllerImplementationProvider call({
    required ResultRecipeService recipeService,
  }) {
    return ResultControllerImplementationProvider(
      recipeService: recipeService,
    );
  }

  @override
  ResultControllerImplementationProvider getProviderOverride(
    covariant ResultControllerImplementationProvider provider,
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
  String? get name => r'resultControllerImplementationProvider';
}

/// See also [ResultControllerImplementation].
class ResultControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<ResultControllerImplementation,
        ResultModel> {
  /// See also [ResultControllerImplementation].
  ResultControllerImplementationProvider({
    required ResultRecipeService recipeService,
  }) : this._internal(
          () => ResultControllerImplementation()..recipeService = recipeService,
          from: resultControllerImplementationProvider,
          name: r'resultControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultControllerImplementationHash,
          dependencies: ResultControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              ResultControllerImplementationFamily._allTransitiveDependencies,
          recipeService: recipeService,
        );

  ResultControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeService,
  }) : super.internal();

  final ResultRecipeService recipeService;

  @override
  ResultModel runNotifierBuild(
    covariant ResultControllerImplementation notifier,
  ) {
    return notifier.build(
      recipeService: recipeService,
    );
  }

  @override
  Override overrideWith(ResultControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: ResultControllerImplementationProvider._internal(
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
  AutoDisposeNotifierProviderElement<ResultControllerImplementation,
      ResultModel> createElement() {
    return _ResultControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultControllerImplementationProvider &&
        other.recipeService == recipeService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResultControllerImplementationRef
    on AutoDisposeNotifierProviderRef<ResultModel> {
  /// The parameter `recipeService` of this provider.
  ResultRecipeService get recipeService;
}

class _ResultControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<ResultControllerImplementation,
        ResultModel> with ResultControllerImplementationRef {
  _ResultControllerImplementationProviderElement(super.provider);

  @override
  ResultRecipeService get recipeService =>
      (origin as ResultControllerImplementationProvider).recipeService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
