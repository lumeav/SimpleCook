// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleRecipe _$SingleRecipeFromJson(Map<String, dynamic> json) {
  return _SingleRecipe.fromJson(json);
}

/// @nodoc
mixin _$SingleRecipe {
  List<String>? get diet => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  int get portions => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get totalTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleRecipeCopyWith<SingleRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleRecipeCopyWith<$Res> {
  factory $SingleRecipeCopyWith(
          SingleRecipe value, $Res Function(SingleRecipe) then) =
      _$SingleRecipeCopyWithImpl<$Res, SingleRecipe>;
  @useResult
  $Res call(
      {List<String>? diet,
      List<String> imageUrls,
      List<Ingredient> ingredients,
      int portions,
      String source,
      List<String> steps,
      String title,
      double totalTime});
}

/// @nodoc
class _$SingleRecipeCopyWithImpl<$Res, $Val extends SingleRecipe>
    implements $SingleRecipeCopyWith<$Res> {
  _$SingleRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diet = freezed,
    Object? imageUrls = null,
    Object? ingredients = null,
    Object? portions = null,
    Object? source = null,
    Object? steps = null,
    Object? title = null,
    Object? totalTime = null,
  }) {
    return _then(_value.copyWith(
      diet: freezed == diet
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      portions: null == portions
          ? _value.portions
          : portions // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleRecipeImplCopyWith<$Res>
    implements $SingleRecipeCopyWith<$Res> {
  factory _$$SingleRecipeImplCopyWith(
          _$SingleRecipeImpl value, $Res Function(_$SingleRecipeImpl) then) =
      __$$SingleRecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? diet,
      List<String> imageUrls,
      List<Ingredient> ingredients,
      int portions,
      String source,
      List<String> steps,
      String title,
      double totalTime});
}

/// @nodoc
class __$$SingleRecipeImplCopyWithImpl<$Res>
    extends _$SingleRecipeCopyWithImpl<$Res, _$SingleRecipeImpl>
    implements _$$SingleRecipeImplCopyWith<$Res> {
  __$$SingleRecipeImplCopyWithImpl(
      _$SingleRecipeImpl _value, $Res Function(_$SingleRecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diet = freezed,
    Object? imageUrls = null,
    Object? ingredients = null,
    Object? portions = null,
    Object? source = null,
    Object? steps = null,
    Object? title = null,
    Object? totalTime = null,
  }) {
    return _then(_$SingleRecipeImpl(
      diet: freezed == diet
          ? _value._diet
          : diet // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      portions: null == portions
          ? _value.portions
          : portions // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleRecipeImpl implements _SingleRecipe {
  _$SingleRecipeImpl(
      {required final List<String>? diet,
      required final List<String> imageUrls,
      required final List<Ingredient> ingredients,
      required this.portions,
      required this.source,
      required final List<String> steps,
      required this.title,
      required this.totalTime})
      : _diet = diet,
        _imageUrls = imageUrls,
        _ingredients = ingredients,
        _steps = steps;

  factory _$SingleRecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleRecipeImplFromJson(json);

  final List<String>? _diet;
  @override
  List<String>? get diet {
    final value = _diet;
    if (value == null) return null;
    if (_diet is EqualUnmodifiableListView) return _diet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final int portions;
  @override
  final String source;
  final List<String> _steps;
  @override
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final String title;
  @override
  final double totalTime;

  @override
  String toString() {
    return 'SingleRecipe(diet: $diet, imageUrls: $imageUrls, ingredients: $ingredients, portions: $portions, source: $source, steps: $steps, title: $title, totalTime: $totalTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleRecipeImpl &&
            const DeepCollectionEquality().equals(other._diet, _diet) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.portions, portions) ||
                other.portions == portions) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_diet),
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_ingredients),
      portions,
      source,
      const DeepCollectionEquality().hash(_steps),
      title,
      totalTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleRecipeImplCopyWith<_$SingleRecipeImpl> get copyWith =>
      __$$SingleRecipeImplCopyWithImpl<_$SingleRecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleRecipeImplToJson(
      this,
    );
  }
}

abstract class _SingleRecipe implements SingleRecipe {
  factory _SingleRecipe(
      {required final List<String>? diet,
      required final List<String> imageUrls,
      required final List<Ingredient> ingredients,
      required final int portions,
      required final String source,
      required final List<String> steps,
      required final String title,
      required final double totalTime}) = _$SingleRecipeImpl;

  factory _SingleRecipe.fromJson(Map<String, dynamic> json) =
      _$SingleRecipeImpl.fromJson;

  @override
  List<String>? get diet;
  @override
  List<String> get imageUrls;
  @override
  List<Ingredient> get ingredients;
  @override
  int get portions;
  @override
  String get source;
  @override
  List<String> get steps;
  @override
  String get title;
  @override
  double get totalTime;
  @override
  @JsonKey(ignore: true)
  _$$SingleRecipeImplCopyWith<_$SingleRecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  String get amount => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call({String amount, String name, String unit});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientImplCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$IngredientImplCopyWith(
          _$IngredientImpl value, $Res Function(_$IngredientImpl) then) =
      __$$IngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String amount, String name, String unit});
}

/// @nodoc
class __$$IngredientImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientImpl>
    implements _$$IngredientImplCopyWith<$Res> {
  __$$IngredientImplCopyWithImpl(
      _$IngredientImpl _value, $Res Function(_$IngredientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_$IngredientImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientImpl implements _Ingredient {
  _$IngredientImpl(
      {required this.amount, required this.name, required this.unit});

  factory _$IngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientImplFromJson(json);

  @override
  final String amount;
  @override
  final String name;
  @override
  final String unit;

  @override
  String toString() {
    return 'Ingredient(amount: $amount, name: $name, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, name, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      __$$IngredientImplCopyWithImpl<_$IngredientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientImplToJson(
      this,
    );
  }
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient(
      {required final String amount,
      required final String name,
      required final String unit}) = _$IngredientImpl;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$IngredientImpl.fromJson;

  @override
  String get amount;
  @override
  String get name;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
