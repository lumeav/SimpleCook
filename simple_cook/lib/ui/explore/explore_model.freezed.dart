// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExploreModel {
  List<Recipe>? get recipes => throw _privateConstructorUsedError;
  Recipe? get recipeOfTheDay => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreModelCopyWith<ExploreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreModelCopyWith<$Res> {
  factory $ExploreModelCopyWith(
          ExploreModel value, $Res Function(ExploreModel) then) =
      _$ExploreModelCopyWithImpl<$Res, ExploreModel>;
  @useResult
  $Res call(
      {List<Recipe>? recipes,
      Recipe? recipeOfTheDay,
      bool isSearching,
      bool error,
      String? errorMessage});
}

/// @nodoc
class _$ExploreModelCopyWithImpl<$Res, $Val extends ExploreModel>
    implements $ExploreModelCopyWith<$Res> {
  _$ExploreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = freezed,
    Object? recipeOfTheDay = freezed,
    Object? isSearching = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      recipes: freezed == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      recipeOfTheDay: freezed == recipeOfTheDay
          ? _value.recipeOfTheDay
          : recipeOfTheDay // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ExploreModelImplCopyWith<$Res>
    implements $ExploreModelCopyWith<$Res> {
  factory _$$ExploreModelImplCopyWith(
          _$ExploreModelImpl value, $Res Function(_$ExploreModelImpl) then) =
      __$$ExploreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Recipe>? recipes,
      Recipe? recipeOfTheDay,
      bool isSearching,
      bool error,
      String? errorMessage});
}

/// @nodoc
class __$$ExploreModelImplCopyWithImpl<$Res>
    extends _$ExploreModelCopyWithImpl<$Res, _$ExploreModelImpl>
    implements _$$ExploreModelImplCopyWith<$Res> {
  __$$ExploreModelImplCopyWithImpl(
      _$ExploreModelImpl _value, $Res Function(_$ExploreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = freezed,
    Object? recipeOfTheDay = freezed,
    Object? isSearching = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ExploreModelImpl(
      recipes: freezed == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      recipeOfTheDay: freezed == recipeOfTheDay
          ? _value.recipeOfTheDay
          : recipeOfTheDay // ignore: cast_nullable_to_non_nullable
              as Recipe?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
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

class _$ExploreModelImpl implements _ExploreModel {
  const _$ExploreModelImpl(
      {final List<Recipe>? recipes,
      this.recipeOfTheDay,
      this.isSearching = false,
      this.error = false,
      this.errorMessage})
      : _recipes = recipes;

  final List<Recipe>? _recipes;
  @override
  List<Recipe>? get recipes {
    final value = _recipes;
    if (value == null) return null;
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Recipe? recipeOfTheDay;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool error;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ExploreModel(recipes: $recipes, recipeOfTheDay: $recipeOfTheDay, isSearching: $isSearching, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExploreModelImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            (identical(other.recipeOfTheDay, recipeOfTheDay) ||
                other.recipeOfTheDay == recipeOfTheDay) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      recipeOfTheDay,
      isSearching,
      error,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreModelImplCopyWith<_$ExploreModelImpl> get copyWith =>
      __$$ExploreModelImplCopyWithImpl<_$ExploreModelImpl>(this, _$identity);
}

abstract class _ExploreModel implements ExploreModel {
  const factory _ExploreModel(
      {final List<Recipe>? recipes,
      final Recipe? recipeOfTheDay,
      final bool isSearching,
      final bool error,
      final String? errorMessage}) = _$ExploreModelImpl;

  @override
  List<Recipe>? get recipes;
  @override
  Recipe? get recipeOfTheDay;
  @override
  bool get isSearching;
  @override
  bool get error;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ExploreModelImplCopyWith<_$ExploreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
