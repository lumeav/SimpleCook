// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultModel {
  GenRecipeModel? get recipe => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  bool get isLoadRecipe => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultModelCopyWith<ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res, ResultModel>;
  @useResult
  $Res call(
      {GenRecipeModel? recipe, String? url, bool isLoadRecipe, bool error});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res, $Val extends ResultModel>
    implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = freezed,
    Object? url = freezed,
    Object? isLoadRecipe = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as GenRecipeModel?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoadRecipe: null == isLoadRecipe
          ? _value.isLoadRecipe
          : isLoadRecipe // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultModelImplCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$$ResultModelImplCopyWith(
          _$ResultModelImpl value, $Res Function(_$ResultModelImpl) then) =
      __$$ResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenRecipeModel? recipe, String? url, bool isLoadRecipe, bool error});
}

/// @nodoc
class __$$ResultModelImplCopyWithImpl<$Res>
    extends _$ResultModelCopyWithImpl<$Res, _$ResultModelImpl>
    implements _$$ResultModelImplCopyWith<$Res> {
  __$$ResultModelImplCopyWithImpl(
      _$ResultModelImpl _value, $Res Function(_$ResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = freezed,
    Object? url = freezed,
    Object? isLoadRecipe = null,
    Object? error = null,
  }) {
    return _then(_$ResultModelImpl(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as GenRecipeModel?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoadRecipe: null == isLoadRecipe
          ? _value.isLoadRecipe
          : isLoadRecipe // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResultModelImpl implements _ResultModel {
  const _$ResultModelImpl(
      {this.recipe, this.url, this.isLoadRecipe = false, this.error = false});

  @override
  final GenRecipeModel? recipe;
  @override
  final String? url;
  @override
  @JsonKey()
  final bool isLoadRecipe;
  @override
  @JsonKey()
  final bool error;

  @override
  String toString() {
    return 'ResultModel(recipe: $recipe, url: $url, isLoadRecipe: $isLoadRecipe, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultModelImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isLoadRecipe, isLoadRecipe) ||
                other.isLoadRecipe == isLoadRecipe) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, recipe, url, isLoadRecipe, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      __$$ResultModelImplCopyWithImpl<_$ResultModelImpl>(this, _$identity);
}

abstract class _ResultModel implements ResultModel {
  const factory _ResultModel(
      {final GenRecipeModel? recipe,
      final String? url,
      final bool isLoadRecipe,
      final bool error}) = _$ResultModelImpl;

  @override
  GenRecipeModel? get recipe;
  @override
  String? get url;
  @override
  bool get isLoadRecipe;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
