import 'package:flutter/material.dart';
import 'package:luna_web_flutter/models/car.dart';
import 'package:luna_web_flutter/presentation/mobile/widgets/home_screen_appbar.dart';
import '../widgets/car_card_widget.dart';
import 'car_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      HomeScreenAppBar(
        key: key,
      ),
      SliverPadding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          sliver: SliverFixedExtentList(
              itemExtent: 157,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Car car = Car(
                    carId: index + 1,
                    color: (100 + index * 100),
                    title: 'Toyota Rav4',
                    yearOfIssue: 2000 + index,
                    subtitle: 'SUV 5 Doors',
                    volume: 2.0,
                    mileage: 50000,
                    location: 'Bishkek',
                    images: [
                      'https://picsum.photos/id/${index + 1}/200/300',
                      'https://picsum.photos/id/${index + 1}/200/300',
                      'https://picsum.photos/id/${index + 1}/200/300'
                    ],
                  );
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CarDetailsScreen(
                            carId: car.carId,
                          ),
                          transitionDuration: const Duration(milliseconds: 0),
                          reverseTransitionDuration:
                              const Duration(microseconds: 0),
                        ),
                      );
                    },
                    child: CarCardWidget(car: car),
                  );
                },
                childCount: 50,
              ))),
    ]);
  }
}
