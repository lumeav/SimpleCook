// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_persistence_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerPersistenceServicePlanner {
  Map<DateTime, Recipe> get recipeMapping => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlannerPersistenceServicePlannerCopyWith<PlannerPersistenceServicePlanner>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerPersistenceServicePlannerCopyWith<$Res> {
  factory $PlannerPersistenceServicePlannerCopyWith(
          PlannerPersistenceServicePlanner value,
          $Res Function(PlannerPersistenceServicePlanner) then) =
      _$PlannerPersistenceServicePlannerCopyWithImpl<$Res,
          PlannerPersistenceServicePlanner>;
  @useResult
  $Res call({Map<DateTime, Recipe> recipeMapping});
}

/// @nodoc
class _$PlannerPersistenceServicePlannerCopyWithImpl<$Res,
        $Val extends PlannerPersistenceServicePlanner>
    implements $PlannerPersistenceServicePlannerCopyWith<$Res> {
  _$PlannerPersistenceServicePlannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeMapping = null,
  }) {
    return _then(_value.copyWith(
      recipeMapping: null == recipeMapping
          ? _value.recipeMapping
          : recipeMapping // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerPersistenceServicePlannerImplCopyWith<$Res>
    implements $PlannerPersistenceServicePlannerCopyWith<$Res> {
  factory _$$PlannerPersistenceServicePlannerImplCopyWith(
          _$PlannerPersistenceServicePlannerImpl value,
          $Res Function(_$PlannerPersistenceServicePlannerImpl) then) =
      __$$PlannerPersistenceServicePlannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<DateTime, Recipe> recipeMapping});
}

/// @nodoc
class __$$PlannerPersistenceServicePlannerImplCopyWithImpl<$Res>
    extends _$PlannerPersistenceServicePlannerCopyWithImpl<$Res,
        _$PlannerPersistenceServicePlannerImpl>
    implements _$$PlannerPersistenceServicePlannerImplCopyWith<$Res> {
  __$$PlannerPersistenceServicePlannerImplCopyWithImpl(
      _$PlannerPersistenceServicePlannerImpl _value,
      $Res Function(_$PlannerPersistenceServicePlannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeMapping = null,
  }) {
    return _then(_$PlannerPersistenceServicePlannerImpl(
      recipeMapping: null == recipeMapping
          ? _value._recipeMapping
          : recipeMapping // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, Recipe>,
    ));
  }
}

/// @nodoc

class _$PlannerPersistenceServicePlannerImpl
    implements _PlannerPersistenceServicePlanner {
  _$PlannerPersistenceServicePlannerImpl(
      {required final Map<DateTime, Recipe> recipeMapping})
      : _recipeMapping = recipeMapping;

  final Map<DateTime, Recipe> _recipeMapping;
  @override
  Map<DateTime, Recipe> get recipeMapping {
    if (_recipeMapping is EqualUnmodifiableMapView) return _recipeMapping;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_recipeMapping);
  }

  @override
  String toString() {
    return 'PlannerPersistenceServicePlanner(recipeMapping: $recipeMapping)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerPersistenceServicePlannerImpl &&
            const DeepCollectionEquality()
                .equals(other._recipeMapping, _recipeMapping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recipeMapping));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerPersistenceServicePlannerImplCopyWith<
          _$PlannerPersistenceServicePlannerImpl>
      get copyWith => __$$PlannerPersistenceServicePlannerImplCopyWithImpl<
          _$PlannerPersistenceServicePlannerImpl>(this, _$identity);
}

abstract class _PlannerPersistenceServicePlanner
    implements PlannerPersistenceServicePlanner {
  factory _PlannerPersistenceServicePlanner(
          {required final Map<DateTime, Recipe> recipeMapping}) =
      _$PlannerPersistenceServicePlannerImpl;

  @override
  Map<DateTime, Recipe> get recipeMapping;
  @override
  @JsonKey(ignore: true)
  _$$PlannerPersistenceServicePlannerImplCopyWith<
          _$PlannerPersistenceServicePlannerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
