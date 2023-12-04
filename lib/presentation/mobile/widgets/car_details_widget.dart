import 'package:flutter/material.dart';
import 'package:luna_web_flutter/models/car.dart';

class CarDetailsWidget extends StatelessWidget {
  final Car car;

  const CarDetailsWidget({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 238, 235, 235),
        color: Color(int.parse(('0xFFE3F2FD'))),
        borderRadius: BorderRadius.circular(5),
      ),
      // padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8.0),
            child: Text(
              '38 000 \$',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(int.parse("0xFFFF7F51")),
                  fontSize: 24),
            ),
          ),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.blue[300],
                  ),
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 8.0, left: 8.0)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  car.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500, // Вес шрифта
                    fontSize: 16, // Размер шрифта
                    height: 1.375, // Интервал строк (22px на 16px)
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.5),
                  color: Colors.black,
                ),
                height: 4.0,
                width: 4.0,
                margin: const EdgeInsets.only(left: 10.0, top: 8.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  car.yearOfIssue.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, // Вес шрифта
                      fontSize: 16, // Размер шрифта
                      height: 1.375,
                      fontFamily: 'Cera pro' // Интервал строк (22px на 16px)
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
                  margin: const EdgeInsets.only(top: 20.0, left: 10.0),

                  // Ваш содержимое первого контейнера
                  child: Text(
                    car.subtitle,
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
                  margin: const EdgeInsets.only(top: 20.0, left: 10.0),

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
                    '${car.volume} / Gasoline',
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
                    '2005 May',
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
                    car.location,
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
                      margin: const EdgeInsets.only(right: 10.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.visibility,
                            size:
                                12, // Установите размер иконки по вашему желанию
                            color: Colors.grey, // Цвет иконки
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '118',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(int.parse("0xFF3D3D3D")),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '30 min ago',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(int.parse("0xFF3D3D3D"))),
                          ),
                        ],
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
