import 'package:flutter/material.dart';
import 'package:luna_web_flutter/models/car.dart';
import 'package:luna_web_flutter/presentation/mobile/widgets/call_button_widget.dart';
import '../widgets/car_images_carousel.dart';
import '../widgets/car_details_widget.dart';
import '../widgets/characteristics_widget.dart';

class CarDetailsScreen extends StatelessWidget {
  final int carId;

  const CarDetailsScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 330.0,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   color: Colors.white,
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // stretchTriggerOffset: 326.0,
          floating: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
              background: CarImagesCarousel(
            images: [
              'https://picsum.photos/id/$carId/200/300',
              'https://picsum.photos/id/${carId + 1}/200/300',
              'https://picsum.photos/id/${carId + 2}/200/300',
              'https://picsum.photos/id/${carId + 3}/200/300',
              'https://picsum.photos/id/${carId + 4}/200/300'
            ],
          )),
        ),

        SliverPadding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            sliver: SliverFixedExtentList(
                itemExtent: 180,
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
                    return CarDetailsWidget(car: car);
                  },
                  childCount: 1,
                ))),

        const SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Characteristic',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 17),
            ),
          ),
        ),

        const CharacteristicsWidget(
          volume: '2.0',
          mileAge: 184000,
          location: 'Bishkek',
          transmission: 'Automatic',
          yearOfIssue: 2005,
        ),
        const CallButtonWidget(phoneNumber: '996708362166')

//
      ]),
    );
  }
}
