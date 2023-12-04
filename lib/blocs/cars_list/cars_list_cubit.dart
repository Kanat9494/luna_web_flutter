import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:luna_web_flutter/api/api.dart';
import 'package:luna_web_flutter/models/car.dart';

part 'cars_list_state.dart';

part 'cars_list_cubit.freezed.dart';

class CarsListCubit extends Cubit<CarsListState> {
  CarsListCubit() : super(const CarsListState());

  Future<void> loadCarsNetwork() async {
    emit(state.copyWith(eventState: CarsListEventState.loading));
    try {
      var cars = await GetIt.I.get<Api>().loadCarsList();
      // if(cars.isEmpty){
      //   cars =  List<Car>.generate(20, (i) {
      //     return
      //     Car(
      //       carId: i + 1,
      //       color: (100 + i * 100),
      //       title: 'Toyota Rav4',
      //       yearOfIssue: 2000 + i,
      //       subtitle: 'SUV 5 Doors',
      //       volume: 2.0,
      //       mileage: 50000,
      //       location: 'Bishkek',
      //       images: [
      //         'https://picsum.photos/id/${i + 1}/200/300',
      //         'https://picsum.photos/id/${i + 1}/200/300',
      //         'https://picsum.photos/id/${i + 1}/200/300'
      //       ],
      //     );
      //   });
      // }
      emit(state.copyWith(cars: cars));
    } catch (e) {
      print(e);
      // var cars =  List<Car>.generate(20, (i) {
      //   return
      //     Car(
      //       carId: i + 1,
      //       color: (100 + i * 100),
      //       title: 'Toyota Rav4',
      //       yearOfIssue: 2000 + i,
      //       subtitle: 'SUV 5 Doors',
      //       volume: 2.0,
      //       mileage: 50000,
      //       location: 'Bishkek',
      //       images: [
      //         'https://picsum.photos/id/${i + 1}/200/300',
      //         'https://picsum.photos/id/${i + 1}/200/300',
      //         'https://picsum.photos/id/${i + 1}/200/300'
      //       ],
      //     );
      // });
      // emit(state.copyWith(cars: cars));
      emit(state.copyWith(eventState: CarsListEventState.error));
    }
    emit(state.copyWith(eventState: CarsListEventState.initial));
  }
}
