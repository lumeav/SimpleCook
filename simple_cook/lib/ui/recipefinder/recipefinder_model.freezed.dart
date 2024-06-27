// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipefinder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeFinderModel {
  List<String> get activeFilters => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<String> get diets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeFinderModelCopyWith<RecipeFinderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeFinderModelCopyWith<$Res> {
  factory $RecipeFinderModelCopyWith(
          RecipeFinderModel value, $Res Function(RecipeFinderModel) then) =
      _$RecipeFinderModelCopyWithImpl<$Res, RecipeFinderModel>;
  @useResult
  $Res call(
      {List<String> activeFilters,
      List<String> categories,
      List<String> diets});
}

/// @nodoc
class _$RecipeFinderModelCopyWithImpl<$Res, $Val extends RecipeFinderModel>
    implements $RecipeFinderModelCopyWith<$Res> {
  _$RecipeFinderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeFilters = null,
    Object? categories = null,
    Object? diets = null,
  }) {
    return _then(_value.copyWith(
      activeFilters: null == activeFilters
          ? _value.activeFilters
          : activeFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      diets: null == diets
          ? _value.diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeFinderModelImplCopyWith<$Res>
    implements $RecipeFinderModelCopyWith<$Res> {
  factory _$$RecipeFinderModelImplCopyWith(_$RecipeFinderModelImpl value,
          $Res Function(_$RecipeFinderModelImpl) then) =
      __$$RecipeFinderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> activeFilters,
      List<String> categories,
      List<String> diets});
}

/// @nodoc
class __$$RecipeFinderModelImplCopyWithImpl<$Res>
    extends _$RecipeFinderModelCopyWithImpl<$Res, _$RecipeFinderModelImpl>
    implements _$$RecipeFinderModelImplCopyWith<$Res> {
  __$$RecipeFinderModelImplCopyWithImpl(_$RecipeFinderModelImpl _value,
      $Res Function(_$RecipeFinderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeFilters = null,
    Object? categories = null,
    Object? diets = null,
  }) {
    return _then(_$RecipeFinderModelImpl(
      activeFilters: null == activeFilters
          ? _value._activeFilters
          : activeFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      diets: null == diets
          ? _value._diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RecipeFinderModelImpl implements _RecipeFinderModel {
  const _$RecipeFinderModelImpl(
      {required final List<String> activeFilters,
      final List<String> categories = const [
        'Alle',
        'Vorspeise',
        'Hauptspeise',
        'Dessert',
        'Snacks'
      ],
      final List<String> diets = const [
        'Alle',
        'Vegetarisch',
        'Vegan',
        'Glutenfrei',
        'Laktosefrei'
      ]})
      : _activeFilters = activeFilters,
        _categories = categories,
        _diets = diets;

  final List<String> _activeFilters;
  @override
  List<String> get activeFilters {
    if (_activeFilters is EqualUnmodifiableListView) return _activeFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeFilters);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _diets;
  @override
  @JsonKey()
  List<String> get diets {
    if (_diets is EqualUnmodifiableListView) return _diets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diets);
  }

  @override
  String toString() {
    return 'RecipeFinderModel(activeFilters: $activeFilters, categories: $categories, diets: $diets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeFinderModelImpl &&
            const DeepCollectionEquality()
                .equals(other._activeFilters, _activeFilters) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._diets, _diets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeFilters),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_diets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeFinderModelImplCopyWith<_$RecipeFinderModelImpl> get copyWith =>
      __$$RecipeFinderModelImplCopyWithImpl<_$RecipeFinderModelImpl>(
          this, _$identity);
}

abstract class _RecipeFinderModel implements RecipeFinderModel {
  const factory _RecipeFinderModel(
      {required final List<String> activeFilters,
      final List<String> categories,
      final List<String> diets}) = _$RecipeFinderModelImpl;

  @override
  List<String> get activeFilters;
  @override
  List<String> get categories;
  @override
  List<String> get diets;
  @override
  @JsonKey(ignore: true)
  _$$RecipeFinderModelImplCopyWith<_$RecipeFinderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
