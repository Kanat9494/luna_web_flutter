import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dropdown_widget.dart';
import 'navbar_notifier.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  double _expandedHeight = 190.0;
  bool _isExpanded = false;
  

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                bottomLeft:
                    Radius.circular(30), // Закругление левого нижнего угла
                bottomRight:
                    Radius.circular(30), // Закругление правого нижнего угла
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
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.grey),
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
                            _expandedHeight = 190.0; // Уменьшаем высоту
                          } else {
                            _expandedHeight = 300.0; // Увеличиваем высоту
                          }
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                              visible: !_isExpanded,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Short filter',
                                    style: TextStyle(
                                        color: Color(int.parse("0xFFD9D9D9")),
                                        fontSize: 14),
                                  ),
                                  Icon(
                                    _isExpanded
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: Color(int.parse("0xFFD9D9D9")),
                                  )
                                ],
                              )),
                          Visibility(
                              visible: _isExpanded,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // Expanded(child: DropdownButton(),)
                                    ],
                                  ),
                                  Text('Test'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Short filter',
                                        style: TextStyle(
                                            color:
                                                Color(int.parse("0xFFD9D9D9")),
                                            fontSize: 14),
                                      ),
                                      Icon(
                                        _isExpanded
                                            ? Icons.keyboard_arrow_up_outlined
                                            : Icons
                                                .keyboard_arrow_down_outlined,
                                        color: Color(int.parse("0xFFD9D9D9")),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
