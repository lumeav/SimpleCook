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
  $Res call({DateTime start, DateTime actual, DateTime end});
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
  $Res call({DateTime start, DateTime actual, DateTime end});
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
    ));
  }
}

/// @nodoc

class _$PlannerModelImpl implements _PlannerModel {
  const _$PlannerModelImpl(
      {required this.start, required this.actual, required this.end});

  @override
  final DateTime start;
  @override
  final DateTime actual;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'PlannerModel(start: $start, actual: $actual, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerModelImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.actual, actual) || other.actual == actual) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, actual, end);

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
      required final DateTime end}) = _$PlannerModelImpl;

  @override
  DateTime get start;
  @override
  DateTime get actual;
  @override
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$$PlannerModelImplCopyWith<_$PlannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
