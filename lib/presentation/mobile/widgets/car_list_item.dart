import 'package:flutter/material.dart';
import 'package:luna_web_flutter/presentation/themes.dart';

import '../../../models/car.dart';
import 'image_carousel_widget.dart';

class CarListItem extends StatefulWidget {
  final Car car;

  const CarListItem({
    super.key,
    required this.car,
  });

  @override
  State<CarListItem> createState() => _CarListItemState();
}

class _CarListItemState extends State<CarListItem> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      height: 134,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).own().containerColor),
      child: Column(
        children: [
          Container(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xff71a8fb)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(widget.car.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.375,
                              )),
                        ),
                        const SizedBox(width: 8),
                        Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.5),
                                color: Colors.black)),
                        SizedBox(width: 8),
                        Text(widget.car.yearOfIssue.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, // Вес шрифта
                                fontSize: 16, // Размер шрифта
                                height: 1.375,
                                fontFamily:
                                    'Cera pro' // Интервал строк (22px на 16px)
                                ))
                      ],
                    ),
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    icon: selected == 0
                        ? const Icon(Icons.favorite_border)
                        : const Icon(Icons.favorite),
                    iconSize: 24,
                    color: Color(0xFFFF7F51),
                    onPressed: () {
                      setState(() {
                        if (selected == 0) {
                          selected = 1;
                        } else {
                          selected = 0;
                        }
                      });
                    })
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 144,
                height: 92,
                child: ImageCarouselWidget(images: widget.car.images),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                height: 92,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.car.subtitle,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3D3D3D)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${widget.car.volume} / Gasoline',
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3D3D3D)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${widget.car.mileage} km',
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3D3D3D)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        widget.car.location,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3D3D3D)),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 92.0,
                margin: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            size:
                                12, // Установите размер иконки по вашему желанию
                            color: Color(0xff000000), // Цвет иконки
                          ),
                          Text(
                            '118',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Text(
                        '30 min ago',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000)),
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
