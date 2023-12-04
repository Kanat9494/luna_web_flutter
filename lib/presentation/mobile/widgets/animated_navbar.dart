import 'dart:math';

import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'navbar_notifier.dart';

class AnimatedNavbar extends StatefulWidget {
  const AnimatedNavbar(
      {super.key,
      required this.model,
      required this.menuItems,
      required this.onItemTapped});

  final List<MenuItem> menuItems;
  final NavbarNotifier model;
  final Function(int) onItemTapped;

  @override
  State<AnimatedNavbar> createState() => _AnimatedNavbarState();
}

class _AnimatedNavbarState extends State<AnimatedNavbar>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant AnimatedNavbar oldWidget) {
    if (widget.model.hideBottomNavbar != isHidden) {
      if (!isHidden) {
        _showBottomNavbar();
      } else {
        _hideBottomNavbar();
      }
      isHidden = !isHidden;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _hideBottomNavbar() {
    _controller.reverse();
    return;
  }

  void _showBottomNavbar() {
    _controller.reverse();
    return;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 100.0).animate(_controller);
  }

  late AnimationController _controller;
  late Animation<double> animation;
  bool isHidden = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(2, -2))
              ]),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: widget.model.index,
                onTap: (x) {
                  widget.onItemTapped(x);
                },
                elevation: 16.0,
                items: widget.menuItems
                    .map((MenuItem menuItem) => BottomNavigationBarItem(
                        icon: Icon(menuItem.iconData), label: menuItem.text))
                    .toList(),
              )),
        );
      },
    );
  }
}
