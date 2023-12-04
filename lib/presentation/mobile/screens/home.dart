import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/account_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/add_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/favorite_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/main_menu_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/main_screen.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/setting_screen.dart';

import 'profile_menu_screen.dart';

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// 7
  int _selectedIndex = 0;
  // 8
  static List<Widget> pages = <Widget>[
    // MainScreen(),
    MainMenu(),
    FavoriteScreen(),
    AddScreen(),
    ProfileMenu()
  ];

// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      // 4
      bottomNavigationBar: BottomNavigationBar(
// 5
        selectedItemColor: Color(0xff3066BE),
// 6
        unselectedItemColor: Color(0xffD9D9D9),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_icon.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/home_icon.svg",
              color: Color(0xff3066BE),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/favorite_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/favorite_icon.svg",
                color: Color(0xff3066BE)),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/add_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/add_icon.svg",
                color: Color(0xff3066BE)),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/profile_icon.svg",
                color: Color(0xff3066BE)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
