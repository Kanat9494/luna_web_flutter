import 'package:flutter/material.dart';

class CharacteristicsWidget extends StatelessWidget {
  final String volume;
  final int mileAge;
  final String location;
  final String transmission;
  final int yearOfIssue;

  const CharacteristicsWidget(
      {Key? key,
      required this.volume,
      required this.mileAge,
      required this.location,
      required this.transmission,
      required this.yearOfIssue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      sliver: SliverToBoxAdapter(
          child: Container(
        height: 98,
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 238, 235, 235),
          color: Color(int.parse(('0xFFE3F2FD'))),
          borderRadius: BorderRadius.circular(5),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    // Первый контейнер
                    height: 15, // Установите желаемую высоту
                    margin: const EdgeInsets.only(top: 10.0, left: 10.0),

                    // Ваш содержимое первого контейнера
                    child: Text(
                      '$volume / Gasoline',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 10.0),

                    // Второй контейнер
                    height: 15, // Установите желаемую высоту
                    child: Text(
                      'Automatic',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    // Первый контейнер
                    height: 15, // Установите желаемую высоту
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),

                    // Ваш содержимое первого контейнера
                    child: Text(
                      '$mileAge km',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // Второй контейнер
                    margin: const EdgeInsets.only(left: 10.0, top: 10),

                    height: 15, // Установите желаемую высоту
                    child: Text(
                      '$yearOfIssue May',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    // Первый контейнер
                    height: 15,
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),

                    // Ваш содержимое первого контейнера
                    child: Text(
                      location,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), // padding: const EdgeInsets.all(16),
      )),
    );
  }
}
