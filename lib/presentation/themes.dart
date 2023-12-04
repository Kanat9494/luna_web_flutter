import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeFields {
  // Colors
  final Color containerColor;
  final Color arrowBackIosIcon;

  const CustomThemeFields({
    this.containerColor = Colors.grey,
    this.arrowBackIosIcon = Colors.grey,
  });
}

extension ThemeDataExtensions on ThemeData {
  static final Map<Brightness, CustomThemeFields> _own = {};

  void addOwn(CustomThemeFields own) {
    _own[brightness] = own;
    // print(brightness);
  }

  static CustomThemeFields? empty;

  CustomThemeFields own() {
    var o = _own[brightness];
    if (o == null) {
      empty ??= const CustomThemeFields();
      o = empty;
    }
    // print(brightness);
    return o!;
  }
}

CustomThemeFields ownTheme(BuildContext context) => Theme.of(context).own();

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // <-- SEE HERE
      statusBarIconBrightness: Brightness.dark,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    foregroundColor: Color(0xff3066BE),
    elevation: 0.0,
    scrolledUnderElevation: 0,
  ),
  scaffoldBackgroundColor: Colors.white,
)..addOwn(
    CustomThemeFields(
      containerColor: Color(0x7fe3f2fd).withOpacity(0.5),
      arrowBackIosIcon: Colors.black,
    ),
  );

final ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // <-- SEE HERE
      statusBarIconBrightness: Brightness.light,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    foregroundColor: Color(0xffffffff),
    elevation: 0.0,
    scrolledUnderElevation: 0,
  ),
  scaffoldBackgroundColor: Colors.black,
)..addOwn(
    CustomThemeFields(
      containerColor: Color(0xff131313),
      arrowBackIosIcon: Color(0xff568BE0),
    ),
  );
