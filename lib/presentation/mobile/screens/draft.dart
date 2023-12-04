import 'package:flutter/material.dart';
import 'package:luna_web_flutter/models/car.dart';
import 'car_details_screen.dart';
import '../widgets/car_card_widget.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({super.key});

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  double _expandedHeight = 163.0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Test'),
          ),
          SliverAppBar(
            expandedHeight: _expandedHeight,
            floating: true,
            centerTitle: true,
            title: const Text(
              'Logo App',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 48, 102, 190),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          30), // Закругление левого нижнего угла
                      bottomRight: Radius.circular(
                          30), // Закругление правого нижнего угла
                    ),
                  ),
                  constraints: const BoxConstraints(
                      minHeight: 163), // Минимальная высота 300 пикселей
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const Text(
                      //   'Logo App',
                      //   style: TextStyle(color: Colors.white, fontSize: 24),
                      // ),
                      const SizedBox(height: 89),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child:
                                        Icon(Icons.search, color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        hintText: 'Search',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 11),
                                      ),
                                      onChanged: (text) {
                                        // Обработка изменений в тексте поиска
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 24,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.tune, color: Colors.grey),
                                  const SizedBox(width: 16),
                                ],
                              ))),
                      Container(
                          padding: const EdgeInsets.only(top: 25),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_isExpanded) {
                                  _expandedHeight = 163.0; // Уменьшаем высоту
                                } else {
                                  _expandedHeight = 300.0; // Увеличиваем высоту
                                }
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Short filter',
                                  style: TextStyle(
                                      color: Color(int.parse("0xFFD9D9D9")),
                                      fontSize: 14),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined,
                                    color: Color(int.parse("0xFFD9D9D9")))
                              ],
                            ),
                          ))
                    ],
                  )),
            ),
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
                              transitionDuration:
                                  const Duration(milliseconds: 0),
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
        ],
      ),
    );
  }
}
