// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DueDate {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DueDateCopyWith<DueDate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueDateCopyWith<$Res> {
  factory $DueDateCopyWith(DueDate value, $Res Function(DueDate) then) =
      _$DueDateCopyWithImpl<$Res, DueDate>;
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class _$DueDateCopyWithImpl<$Res, $Val extends DueDate>
    implements $DueDateCopyWith<$Res> {
  _$DueDateCopyWithImpl(this._value, this._then);

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
abstract class _$$DueDateImplCopyWith<$Res> implements $DueDateCopyWith<$Res> {
  factory _$$DueDateImplCopyWith(
          _$DueDateImpl value, $Res Function(_$DueDateImpl) then) =
      __$$DueDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class __$$DueDateImplCopyWithImpl<$Res>
    extends _$DueDateCopyWithImpl<$Res, _$DueDateImpl>
    implements _$$DueDateImplCopyWith<$Res> {
  __$$DueDateImplCopyWithImpl(
      _$DueDateImpl _value, $Res Function(_$DueDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? isAllDay = null,
  }) {
    return _then(_$DueDateImpl(
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

class _$DueDateImpl implements _DueDate {
  const _$DueDateImpl({required this.dateTime, required this.isAllDay});

  @override
  final DateTime? dateTime;
  @override
  final bool isAllDay;

  @override
  String toString() {
    return 'DueDate(dateTime: $dateTime, isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DueDateImpl &&
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
  _$$DueDateImplCopyWith<_$DueDateImpl> get copyWith =>
      __$$DueDateImplCopyWithImpl<_$DueDateImpl>(this, _$identity);
}

abstract class _DueDate implements DueDate {
  const factory _DueDate(
      {required final DateTime? dateTime,
      required final bool isAllDay}) = _$DueDateImpl;

  @override
  DateTime? get dateTime;
  @override
  bool get isAllDay;
  @override
  @JsonKey(ignore: true)
  _$$DueDateImplCopyWith<_$DueDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
