// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DueDateModel {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DueDateModelCopyWith<DueDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueDateModelCopyWith<$Res> {
  factory $DueDateModelCopyWith(
          DueDateModel value, $Res Function(DueDateModel) then) =
      _$DueDateModelCopyWithImpl<$Res, DueDateModel>;
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class _$DueDateModelCopyWithImpl<$Res, $Val extends DueDateModel>
    implements $DueDateModelCopyWith<$Res> {
  _$DueDateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? isAllDay = null,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DueDateModelCopyWith<$Res>
    implements $DueDateModelCopyWith<$Res> {
  factory _$$_DueDateModelCopyWith(
          _$_DueDateModel value, $Res Function(_$_DueDateModel) then) =
      __$$_DueDateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class __$$_DueDateModelCopyWithImpl<$Res>
    extends _$DueDateModelCopyWithImpl<$Res, _$_DueDateModel>
    implements _$$_DueDateModelCopyWith<$Res> {
  __$$_DueDateModelCopyWithImpl(
      _$_DueDateModel _value, $Res Function(_$_DueDateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? isAllDay = null,
  }) {
    return _then(_$_DueDateModel(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DueDateModel implements _DueDateModel {
  const _$_DueDateModel({required this.dateTime, required this.isAllDay});

  @override
  final DateTime? dateTime;
  @override
  final bool isAllDay;

  @override
  String toString() {
    return 'DueDateModel(dateTime: $dateTime, isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DueDateModel &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, isAllDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DueDateModelCopyWith<_$_DueDateModel> get copyWith =>
      __$$_DueDateModelCopyWithImpl<_$_DueDateModel>(this, _$identity);
}

abstract class _DueDateModel implements DueDateModel {
  const factory _DueDateModel(
      {required final DateTime? dateTime,
      required final bool isAllDay}) = _$_DueDateModel;

  @override
  DateTime? get dateTime;
  @override
  bool get isAllDay;
  @override
  @JsonKey(ignore: true)
  _$$_DueDateModelCopyWith<_$_DueDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
