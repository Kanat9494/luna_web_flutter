import 'package:flutter/material.dart';
import 'package:luna_web_flutter/models/car.dart';
import 'image_carousel_widget.dart';

class CarCardWidget extends StatelessWidget {
  final Car car;

  const CarCardWidget({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(5),
      ),
      // padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.orange[car.color],
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
              const Spacer(),
              Container(
                  margin: const EdgeInsets.only(top: 8.0, right: 10.0),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Color(0xFFFF7F51),
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                width: 144,
                height: 92,

                margin: const EdgeInsets.only(top: 8.0, left: 8.0),
//
                child: ImageCarouselWidget(images: car.images),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                height: 99,
                width: 82,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.subtitle,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(int.parse("0xFF3D3D3D"))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${car.volume} / Gasoline',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(int.parse("0xFF3D3D3D"))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${car.mileage} km',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(int.parse("0xFF3D3D3D"))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        car.location,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(int.parse("0xFF3D3D3D"))),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 92.0,
                margin: const EdgeInsets.only(right: 8.0),
                width: 49.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.visibility,
                            size:
                                12, // Установите размер иконки по вашему желанию
                            color: Colors.grey, // Цвет иконки
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
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '30 min ago',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Color(int.parse("0xFF3D3D3D"))),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
