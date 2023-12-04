import 'package:flutter/material.dart';

class NavbarNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  bool _hideBottomNavBar = false;

  set index(int x) {
    _index = x;
    notifyListeners();
  }

  bool get hideBottomNavbar => _hideBottomNavBar;
  set hideBottomNavbar(bool x) {
    _hideBottomNavBar = x;
    notifyListeners();
  }
}
