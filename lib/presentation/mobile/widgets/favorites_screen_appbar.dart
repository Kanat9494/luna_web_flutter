import 'package:flutter/material.dart';

class FavoritesScreenAppbar extends StatelessWidget {
  const FavoritesScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 163,
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
              ],
            )),
      ),
    );
  }
}
