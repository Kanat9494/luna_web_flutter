// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cars_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarsListState {
  List<Car> get cars => throw _privateConstructorUsedError;
  CarsListEventState get eventState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarsListStateCopyWith<CarsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarsListStateCopyWith<$Res> {
  factory $CarsListStateCopyWith(
          CarsListState value, $Res Function(CarsListState) then) =
      _$CarsListStateCopyWithImpl<$Res, CarsListState>;
  @useResult
  $Res call({List<Car> cars, CarsListEventState eventState});
}

/// @nodoc
class _$CarsListStateCopyWithImpl<$Res, $Val extends CarsListState>
    implements $CarsListStateCopyWith<$Res> {
  _$CarsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? eventState = null,
  }) {
    return _then(_value.copyWith(
      cars: null == cars
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as CarsListEventState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CarsListStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Car> cars, CarsListEventState eventState});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CarsListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? eventState = null,
  }) {
    return _then(_$InitialImpl(
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as CarsListEventState,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Car> cars = const [],
      this.eventState = CarsListEventState.loading})
      : _cars = cars;

  final List<Car> _cars;
  @override
  @JsonKey()
  List<Car> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  @JsonKey()
  final CarsListEventState eventState;

  @override
  String toString() {
    return 'CarsListState(cars: $cars, eventState: $eventState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._cars, _cars) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cars), eventState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CarsListState {
  const factory _Initial(
      {final List<Car> cars,
      final CarsListEventState eventState}) = _$InitialImpl;

  @override
  List<Car> get cars;
  @override
  CarsListEventState get eventState;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
