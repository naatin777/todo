// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DueDate {
  DateTime? get dateTime;
  bool get isAllDay;

  /// Create a copy of DueDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DueDateCopyWith<DueDate> get copyWith =>
      _$DueDateCopyWithImpl<DueDate>(this as DueDate, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DueDate &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, isAllDay);

  @override
  String toString() {
    return 'DueDate(dateTime: $dateTime, isAllDay: $isAllDay)';
  }
}

/// @nodoc
abstract mixin class $DueDateCopyWith<$Res> {
  factory $DueDateCopyWith(DueDate value, $Res Function(DueDate) _then) =
      _$DueDateCopyWithImpl;
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class _$DueDateCopyWithImpl<$Res> implements $DueDateCopyWith<$Res> {
  _$DueDateCopyWithImpl(this._self, this._then);

  final DueDate _self;
  final $Res Function(DueDate) _then;

  /// Create a copy of DueDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? isAllDay = null,
  }) {
    return _then(_self.copyWith(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAllDay: null == isAllDay
          ? _self.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _DueDate implements DueDate {
  const _DueDate({required this.dateTime, required this.isAllDay});

  @override
  final DateTime? dateTime;
  @override
  final bool isAllDay;

  /// Create a copy of DueDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DueDateCopyWith<_DueDate> get copyWith =>
      __$DueDateCopyWithImpl<_DueDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DueDate &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, isAllDay);

  @override
  String toString() {
    return 'DueDate(dateTime: $dateTime, isAllDay: $isAllDay)';
  }
}

/// @nodoc
abstract mixin class _$DueDateCopyWith<$Res> implements $DueDateCopyWith<$Res> {
  factory _$DueDateCopyWith(_DueDate value, $Res Function(_DueDate) _then) =
      __$DueDateCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime? dateTime, bool isAllDay});
}

/// @nodoc
class __$DueDateCopyWithImpl<$Res> implements _$DueDateCopyWith<$Res> {
  __$DueDateCopyWithImpl(this._self, this._then);

  final _DueDate _self;
  final $Res Function(_DueDate) _then;

  /// Create a copy of DueDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dateTime = freezed,
    Object? isAllDay = null,
  }) {
    return _then(_DueDate(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAllDay: null == isAllDay
          ? _self.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
