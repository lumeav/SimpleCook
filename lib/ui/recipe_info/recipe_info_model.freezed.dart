// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeInfoModel {
  SingleRecipe? get recipe => throw _privateConstructorUsedError;
  bool get fetchFinished => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeInfoModelCopyWith<RecipeInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeInfoModelCopyWith<$Res> {
  factory $RecipeInfoModelCopyWith(
          RecipeInfoModel value, $Res Function(RecipeInfoModel) then) =
      _$RecipeInfoModelCopyWithImpl<$Res, RecipeInfoModel>;
  @useResult
  $Res call(
      {SingleRecipe? recipe,
      bool fetchFinished,
      bool error,
      String? errorMessage});
}

/// @nodoc
class _$RecipeInfoModelCopyWithImpl<$Res, $Val extends RecipeInfoModel>
    implements $RecipeInfoModelCopyWith<$Res> {
  _$RecipeInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as SingleRecipe?,
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
abstract class _$$RecipeInfoModelImplCopyWith<$Res>
    implements $RecipeInfoModelCopyWith<$Res> {
  factory _$$RecipeInfoModelImplCopyWith(_$RecipeInfoModelImpl value,
          $Res Function(_$RecipeInfoModelImpl) then) =
      __$$RecipeInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SingleRecipe? recipe,
      bool fetchFinished,
      bool error,
      String? errorMessage});
}

/// @nodoc
class __$$RecipeInfoModelImplCopyWithImpl<$Res>
    extends _$RecipeInfoModelCopyWithImpl<$Res, _$RecipeInfoModelImpl>
    implements _$$RecipeInfoModelImplCopyWith<$Res> {
  __$$RecipeInfoModelImplCopyWithImpl(
      _$RecipeInfoModelImpl _value, $Res Function(_$RecipeInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$RecipeInfoModelImpl(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as SingleRecipe?,
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

class _$RecipeInfoModelImpl implements _RecipeInfoModel {
  const _$RecipeInfoModelImpl(
      {this.recipe,
      this.fetchFinished = false,
      this.error = false,
      this.errorMessage});

  @override
  final SingleRecipe? recipe;
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
    return 'RecipeInfoModel(recipe: $recipe, fetchFinished: $fetchFinished, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeInfoModelImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.fetchFinished, fetchFinished) ||
                other.fetchFinished == fetchFinished) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, recipe, fetchFinished, error, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeInfoModelImplCopyWith<_$RecipeInfoModelImpl> get copyWith =>
      __$$RecipeInfoModelImplCopyWithImpl<_$RecipeInfoModelImpl>(
          this, _$identity);
}

abstract class _RecipeInfoModel implements RecipeInfoModel {
  const factory _RecipeInfoModel(
      {final SingleRecipe? recipe,
      final bool fetchFinished,
      final bool error,
      final String? errorMessage}) = _$RecipeInfoModelImpl;

  @override
  SingleRecipe? get recipe;
  @override
  bool get fetchFinished;
  @override
  bool get error;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$RecipeInfoModelImplCopyWith<_$RecipeInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
