import 'package:flutter/material.dart';
import 'package:luna_web_flutter/presentation/themes.dart';

class ThemeModel with ChangeNotifier {
  bool isSwitched = false;
  late ThemeData _mode;
  ThemeData get mode {
    return _mode = isSwitched ? lightTheme : darkTheme;
  }

  void toggleMode(bool isSwitched) {
    this.isSwitched = isSwitched;
    _mode = this.isSwitched ? lightTheme : darkTheme;
    notifyListeners();
  }
}
