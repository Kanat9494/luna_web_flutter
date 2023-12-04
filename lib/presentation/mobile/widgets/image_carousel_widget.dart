import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<String> images;

  const ImageCarouselWidget({super.key, required this.images});

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 360.0,
            // autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: DotsIndicator(
            dotsCount: widget.images.length,
            position: _currentIndex.toDouble(),
            decorator: DotsDecorator(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              size: const Size(6, 6),
            ),
          ),
        ),
      ],
    );
  }
}
