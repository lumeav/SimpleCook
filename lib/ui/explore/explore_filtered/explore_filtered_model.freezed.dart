// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_filtered_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExploreFilteredModel {
  List<Recipe>? get filteredRecipes => throw _privateConstructorUsedError;
  bool get fetchFinished => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreFilteredModelCopyWith<ExploreFilteredModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreFilteredModelCopyWith<$Res> {
  factory $ExploreFilteredModelCopyWith(ExploreFilteredModel value,
          $Res Function(ExploreFilteredModel) then) =
      _$ExploreFilteredModelCopyWithImpl<$Res, ExploreFilteredModel>;
  @useResult
  $Res call(
      {List<Recipe>? filteredRecipes,
      bool fetchFinished,
      bool error,
      String? errorMessage});
}

/// @nodoc
class _$ExploreFilteredModelCopyWithImpl<$Res,
        $Val extends ExploreFilteredModel>
    implements $ExploreFilteredModelCopyWith<$Res> {
  _$ExploreFilteredModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredRecipes = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      filteredRecipes: freezed == filteredRecipes
          ? _value.filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      fetchFinished: null == fetchFinished
          ? _value.fetchFinished
          : fetchFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExploreFilteredModelImplCopyWith<$Res>
    implements $ExploreFilteredModelCopyWith<$Res> {
  factory _$$ExploreFilteredModelImplCopyWith(_$ExploreFilteredModelImpl value,
          $Res Function(_$ExploreFilteredModelImpl) then) =
      __$$ExploreFilteredModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Recipe>? filteredRecipes,
      bool fetchFinished,
      bool error,
      String? errorMessage});
}

/// @nodoc
class __$$ExploreFilteredModelImplCopyWithImpl<$Res>
    extends _$ExploreFilteredModelCopyWithImpl<$Res, _$ExploreFilteredModelImpl>
    implements _$$ExploreFilteredModelImplCopyWith<$Res> {
  __$$ExploreFilteredModelImplCopyWithImpl(_$ExploreFilteredModelImpl _value,
      $Res Function(_$ExploreFilteredModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredRecipes = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ExploreFilteredModelImpl(
      filteredRecipes: freezed == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      fetchFinished: null == fetchFinished
          ? _value.fetchFinished
          : fetchFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExploreFilteredModelImpl implements _ExploreFilteredModel {
  const _$ExploreFilteredModelImpl(
      {final List<Recipe>? filteredRecipes,
      this.fetchFinished = false,
      this.error = false,
      this.errorMessage})
      : _filteredRecipes = filteredRecipes;

  final List<Recipe>? _filteredRecipes;
  @override
  List<Recipe>? get filteredRecipes {
    final value = _filteredRecipes;
    if (value == null) return null;
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool fetchFinished;
  @override
  @JsonKey()
  final bool error;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ExploreFilteredModel(filteredRecipes: $filteredRecipes, fetchFinished: $fetchFinished, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExploreFilteredModelImpl &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes) &&
            (identical(other.fetchFinished, fetchFinished) ||
                other.fetchFinished == fetchFinished) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filteredRecipes),
      fetchFinished,
      error,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreFilteredModelImplCopyWith<_$ExploreFilteredModelImpl>
      get copyWith =>
          __$$ExploreFilteredModelImplCopyWithImpl<_$ExploreFilteredModelImpl>(
              this, _$identity);
}

abstract class _ExploreFilteredModel implements ExploreFilteredModel {
  const factory _ExploreFilteredModel(
      {final List<Recipe>? filteredRecipes,
      final bool fetchFinished,
      final bool error,
      final String? errorMessage}) = _$ExploreFilteredModelImpl;

  @override
  List<Recipe>? get filteredRecipes;
  @override
  bool get fetchFinished;
  @override
  bool get error;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ExploreFilteredModelImplCopyWith<_$ExploreFilteredModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
