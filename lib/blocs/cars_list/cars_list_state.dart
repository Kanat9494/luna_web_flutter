part of 'cars_list_cubit.dart';

enum CarsListEventState {
  initial,
  loading,
  error,
}

@freezed
class CarsListState with _$CarsListState {
  const factory CarsListState({
    @Default([]) List<Car> cars,
    @Default(CarsListEventState.loading) CarsListEventState eventState,
}) = _Initial;
}
