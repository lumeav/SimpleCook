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
  SingleRecipe? get singleRecipe => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  bool get fetchFinished => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
      {GenRecipeModel? recipe,
      SingleRecipe? singleRecipe,
      String? url,
      bool fetchFinished,
      bool error,
      String? errorMessage});
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
    Object? singleRecipe = freezed,
    Object? url = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as GenRecipeModel?,
      singleRecipe: freezed == singleRecipe
          ? _value.singleRecipe
          : singleRecipe // ignore: cast_nullable_to_non_nullable
              as SingleRecipe?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ResultModelImplCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$$ResultModelImplCopyWith(
          _$ResultModelImpl value, $Res Function(_$ResultModelImpl) then) =
      __$$ResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenRecipeModel? recipe,
      SingleRecipe? singleRecipe,
      String? url,
      bool fetchFinished,
      bool error,
      String? errorMessage});
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
    Object? singleRecipe = freezed,
    Object? url = freezed,
    Object? fetchFinished = null,
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ResultModelImpl(
      recipe: freezed == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as GenRecipeModel?,
      singleRecipe: freezed == singleRecipe
          ? _value.singleRecipe
          : singleRecipe // ignore: cast_nullable_to_non_nullable
              as SingleRecipe?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$ResultModelImpl implements _ResultModel {
  const _$ResultModelImpl(
      {this.recipe,
      this.singleRecipe,
      this.url,
      this.fetchFinished = false,
      this.error = false,
      this.errorMessage});

  @override
  final GenRecipeModel? recipe;
  @override
  final SingleRecipe? singleRecipe;
  @override
  final String? url;
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
    return 'ResultModel(recipe: $recipe, singleRecipe: $singleRecipe, url: $url, fetchFinished: $fetchFinished, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultModelImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.singleRecipe, singleRecipe) ||
                other.singleRecipe == singleRecipe) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fetchFinished, fetchFinished) ||
                other.fetchFinished == fetchFinished) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipe, singleRecipe, url,
      fetchFinished, error, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      __$$ResultModelImplCopyWithImpl<_$ResultModelImpl>(this, _$identity);
}

abstract class _ResultModel implements ResultModel {
  const factory _ResultModel(
      {final GenRecipeModel? recipe,
      final SingleRecipe? singleRecipe,
      final String? url,
      final bool fetchFinished,
      final bool error,
      final String? errorMessage}) = _$ResultModelImpl;

  @override
  GenRecipeModel? get recipe;
  @override
  SingleRecipe? get singleRecipe;
  @override
  String? get url;
  @override
  bool get fetchFinished;
  @override
  bool get error;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ResultModelImplCopyWith<_$ResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
