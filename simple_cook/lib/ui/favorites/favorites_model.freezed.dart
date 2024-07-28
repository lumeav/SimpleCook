// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritesModel {
  List<SingleRecipe> get favoriteRecipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesModelCopyWith<FavoritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesModelCopyWith<$Res> {
  factory $FavoritesModelCopyWith(
          FavoritesModel value, $Res Function(FavoritesModel) then) =
      _$FavoritesModelCopyWithImpl<$Res, FavoritesModel>;
  @useResult
  $Res call({List<SingleRecipe> favoriteRecipes});
}

/// @nodoc
class _$FavoritesModelCopyWithImpl<$Res, $Val extends FavoritesModel>
    implements $FavoritesModelCopyWith<$Res> {
  _$FavoritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteRecipes = null,
  }) {
    return _then(_value.copyWith(
      favoriteRecipes: null == favoriteRecipes
          ? _value.favoriteRecipes
          : favoriteRecipes // ignore: cast_nullable_to_non_nullable
              as List<SingleRecipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesModelImplCopyWith<$Res>
    implements $FavoritesModelCopyWith<$Res> {
  factory _$$FavoritesModelImplCopyWith(_$FavoritesModelImpl value,
          $Res Function(_$FavoritesModelImpl) then) =
      __$$FavoritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SingleRecipe> favoriteRecipes});
}

/// @nodoc
class __$$FavoritesModelImplCopyWithImpl<$Res>
    extends _$FavoritesModelCopyWithImpl<$Res, _$FavoritesModelImpl>
    implements _$$FavoritesModelImplCopyWith<$Res> {
  __$$FavoritesModelImplCopyWithImpl(
      _$FavoritesModelImpl _value, $Res Function(_$FavoritesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteRecipes = null,
  }) {
    return _then(_$FavoritesModelImpl(
      favoriteRecipes: null == favoriteRecipes
          ? _value._favoriteRecipes
          : favoriteRecipes // ignore: cast_nullable_to_non_nullable
              as List<SingleRecipe>,
    ));
  }
}

/// @nodoc

class _$FavoritesModelImpl implements _FavoritesModel {
  const _$FavoritesModelImpl(
      {final List<SingleRecipe> favoriteRecipes = const <SingleRecipe>[]})
      : _favoriteRecipes = favoriteRecipes;

  final List<SingleRecipe> _favoriteRecipes;
  @override
  @JsonKey()
  List<SingleRecipe> get favoriteRecipes {
    if (_favoriteRecipes is EqualUnmodifiableListView) return _favoriteRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteRecipes);
  }

  @override
  String toString() {
    return 'FavoritesModel(favoriteRecipes: $favoriteRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteRecipes, _favoriteRecipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteRecipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesModelImplCopyWith<_$FavoritesModelImpl> get copyWith =>
      __$$FavoritesModelImplCopyWithImpl<_$FavoritesModelImpl>(
          this, _$identity);
}

abstract class _FavoritesModel implements FavoritesModel {
  const factory _FavoritesModel({final List<SingleRecipe> favoriteRecipes}) =
      _$FavoritesModelImpl;

  @override
  List<SingleRecipe> get favoriteRecipes;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesModelImplCopyWith<_$FavoritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
