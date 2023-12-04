import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'setting_screen.dart';

class ProfileMenu extends StatelessWidget{
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: "/",
        onGenerateRoute: (settings){
          Widget page = AccountScreen();
          if(settings.name == "settings"){
            // return _createRoute(settings.arguments as int);
            page = SettingScreen();
          }
          return MaterialPageRoute(builder: (_) => page);
        }
    );
  }
}