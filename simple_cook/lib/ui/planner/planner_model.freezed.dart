// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerModel {
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get actual => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  List<DateTime> get dates => throw _privateConstructorUsedError;
  Map<String, List<SingleRecipe>> get recipes =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlannerModelCopyWith<PlannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerModelCopyWith<$Res> {
  factory $PlannerModelCopyWith(
          PlannerModel value, $Res Function(PlannerModel) then) =
      _$PlannerModelCopyWithImpl<$Res, PlannerModel>;
  @useResult
  $Res call(
      {DateTime start,
      DateTime actual,
      DateTime end,
      List<DateTime> dates,
      Map<String, List<SingleRecipe>> recipes});
}

/// @nodoc
class _$PlannerModelCopyWithImpl<$Res, $Val extends PlannerModel>
    implements $PlannerModelCopyWith<$Res> {
  _$PlannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? actual = null,
    Object? end = null,
    Object? dates = null,
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actual: null == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SingleRecipe>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerModelImplCopyWith<$Res>
    implements $PlannerModelCopyWith<$Res> {
  factory _$$PlannerModelImplCopyWith(
          _$PlannerModelImpl value, $Res Function(_$PlannerModelImpl) then) =
      __$$PlannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime start,
      DateTime actual,
      DateTime end,
      List<DateTime> dates,
      Map<String, List<SingleRecipe>> recipes});
}

/// @nodoc
class __$$PlannerModelImplCopyWithImpl<$Res>
    extends _$PlannerModelCopyWithImpl<$Res, _$PlannerModelImpl>
    implements _$$PlannerModelImplCopyWith<$Res> {
  __$$PlannerModelImplCopyWithImpl(
      _$PlannerModelImpl _value, $Res Function(_$PlannerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? actual = null,
    Object? end = null,
    Object? dates = null,
    Object? recipes = null,
  }) {
    return _then(_$PlannerModelImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actual: null == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SingleRecipe>>,
    ));
  }
}

/// @nodoc

class _$PlannerModelImpl implements _PlannerModel {
  const _$PlannerModelImpl(
      {required this.start,
      required this.actual,
      required this.end,
      required final List<DateTime> dates,
      required final Map<String, List<SingleRecipe>> recipes})
      : _dates = dates,
        _recipes = recipes;

  @override
  final DateTime start;
  @override
  final DateTime actual;
  @override
  final DateTime end;
  final List<DateTime> _dates;
  @override
  List<DateTime> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  final Map<String, List<SingleRecipe>> _recipes;
  @override
  Map<String, List<SingleRecipe>> get recipes {
    if (_recipes is EqualUnmodifiableMapView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_recipes);
  }

  @override
  String toString() {
    return 'PlannerModel(start: $start, actual: $actual, end: $end, dates: $dates, recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerModelImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.actual, actual) || other.actual == actual) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      start,
      actual,
      end,
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerModelImplCopyWith<_$PlannerModelImpl> get copyWith =>
      __$$PlannerModelImplCopyWithImpl<_$PlannerModelImpl>(this, _$identity);
}

abstract class _PlannerModel implements PlannerModel {
  const factory _PlannerModel(
          {required final DateTime start,
          required final DateTime actual,
          required final DateTime end,
          required final List<DateTime> dates,
          required final Map<String, List<SingleRecipe>> recipes}) =
      _$PlannerModelImpl;

  @override
  DateTime get start;
  @override
  DateTime get actual;
  @override
  DateTime get end;
  @override
  List<DateTime> get dates;
  @override
  Map<String, List<SingleRecipe>> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$PlannerModelImplCopyWith<_$PlannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
