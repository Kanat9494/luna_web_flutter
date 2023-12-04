import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luna_web_flutter/blocs/cars_list/cars_list_cubit.dart';
import 'package:luna_web_flutter/presentation/themes.dart';
import 'package:luna_web_flutter/presentation/mobile/widgets/car_list_item.dart';

import '../../../models/car.dart';

// 1
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    BlocProvider.of<CarsListCubit>(context).loadCarsNetwork();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Luna",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'short_filter');
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).own().containerColor),
                // color: const Color(0x7fe3f2fd).withOpacity(0.5)),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.search,
                      size: 24,
                      color: Color(0xffA0A0A0),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Search",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA0A0A0),
                        ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<CarsListCubit, CarsListState>(
              builder: (context, state) {
                print(state.eventState);
                if (state.eventState == CarsListEventState.loading) {
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                }
                if (state.eventState == CarsListEventState.error) {
                  return Center(
                    child: Text('Error occurred!'),
                  );
                }
                if (state.cars.isEmpty) {
                  return Center(
                    child: Text('List is empty!'),
                  );
                }
                return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.cars.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Car car = Car(
                      //   carId: index + 1,
                      //   color: (100 + index * 100),
                      //   title: 'Toyota Rav4',
                      //   yearOfIssue: 2000 + index,
                      //   subtitle: 'SUV 5 Doors',
                      //   volume: 2.0,
                      //   mileage: 50000,
                      //   location: 'Bishkek',
                      //   images: [
                      //     'https://picsum.photos/id/${index + 1}/200/300',
                      //     'https://picsum.photos/id/${index + 1}/200/300',
                      //     'https://picsum.photos/id/${index + 1}/200/300'
                      //   ],
                      // );
                      final car = state.cars[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return CarDetailsScreen(
                          //     carId: car.carId,
                          //   );
                          // }));
                          Navigator.pushNamed(context, 'car_detail',
                              arguments: car.carId);
                        },
                        child: CarListItem(car: car),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
