// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_persistence_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritesPersistenceServiceFavorites {
  List<Recipe> get favoriteRecipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesPersistenceServiceFavoritesCopyWith<
          FavoritesPersistenceServiceFavorites>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesPersistenceServiceFavoritesCopyWith<$Res> {
  factory $FavoritesPersistenceServiceFavoritesCopyWith(
          FavoritesPersistenceServiceFavorites value,
          $Res Function(FavoritesPersistenceServiceFavorites) then) =
      _$FavoritesPersistenceServiceFavoritesCopyWithImpl<$Res,
          FavoritesPersistenceServiceFavorites>;
  @useResult
  $Res call({List<Recipe> favoriteRecipes});
}

/// @nodoc
class _$FavoritesPersistenceServiceFavoritesCopyWithImpl<$Res,
        $Val extends FavoritesPersistenceServiceFavorites>
    implements $FavoritesPersistenceServiceFavoritesCopyWith<$Res> {
  _$FavoritesPersistenceServiceFavoritesCopyWithImpl(this._value, this._then);

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
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesPersistenceServiceFavoritesImplCopyWith<$Res>
    implements $FavoritesPersistenceServiceFavoritesCopyWith<$Res> {
  factory _$$FavoritesPersistenceServiceFavoritesImplCopyWith(
          _$FavoritesPersistenceServiceFavoritesImpl value,
          $Res Function(_$FavoritesPersistenceServiceFavoritesImpl) then) =
      __$$FavoritesPersistenceServiceFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> favoriteRecipes});
}

/// @nodoc
class __$$FavoritesPersistenceServiceFavoritesImplCopyWithImpl<$Res>
    extends _$FavoritesPersistenceServiceFavoritesCopyWithImpl<$Res,
        _$FavoritesPersistenceServiceFavoritesImpl>
    implements _$$FavoritesPersistenceServiceFavoritesImplCopyWith<$Res> {
  __$$FavoritesPersistenceServiceFavoritesImplCopyWithImpl(
      _$FavoritesPersistenceServiceFavoritesImpl _value,
      $Res Function(_$FavoritesPersistenceServiceFavoritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteRecipes = null,
  }) {
    return _then(_$FavoritesPersistenceServiceFavoritesImpl(
      favoriteRecipes: null == favoriteRecipes
          ? _value._favoriteRecipes
          : favoriteRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$FavoritesPersistenceServiceFavoritesImpl
    implements _FavoritesPersistenceServiceFavorites {
  _$FavoritesPersistenceServiceFavoritesImpl(
      {required final List<Recipe> favoriteRecipes})
      : _favoriteRecipes = favoriteRecipes;

  final List<Recipe> _favoriteRecipes;
  @override
  List<Recipe> get favoriteRecipes {
    if (_favoriteRecipes is EqualUnmodifiableListView) return _favoriteRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteRecipes);
  }

  @override
  String toString() {
    return 'FavoritesPersistenceServiceFavorites(favoriteRecipes: $favoriteRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesPersistenceServiceFavoritesImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteRecipes, _favoriteRecipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteRecipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesPersistenceServiceFavoritesImplCopyWith<
          _$FavoritesPersistenceServiceFavoritesImpl>
      get copyWith => __$$FavoritesPersistenceServiceFavoritesImplCopyWithImpl<
          _$FavoritesPersistenceServiceFavoritesImpl>(this, _$identity);
}

abstract class _FavoritesPersistenceServiceFavorites
    implements FavoritesPersistenceServiceFavorites {
  factory _FavoritesPersistenceServiceFavorites(
          {required final List<Recipe> favoriteRecipes}) =
      _$FavoritesPersistenceServiceFavoritesImpl;

  @override
  List<Recipe> get favoriteRecipes;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesPersistenceServiceFavoritesImplCopyWith<
          _$FavoritesPersistenceServiceFavoritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
