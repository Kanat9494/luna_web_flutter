import 'package:flutter/material.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/car_details_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/main_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/short_filter_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        Widget page = MainScreen();
        if (settings.name == "car_detail") {
          // return _createRoute(settings.arguments as int);
          page = CarDetailsScreen(carId: settings.arguments as int);
        }
        if (settings.name == "short_filter") {
          page = ShortFilterScreen();
        }
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }

  Route _createRoute(int id) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          CarDetailsScreen(carId: id),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
        //   SlideTransition(
        //   position: animation.drive(tween),
        //   child: child,
        // );
      },
    );
  }
}
