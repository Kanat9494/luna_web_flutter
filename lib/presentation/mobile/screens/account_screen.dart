import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Profile",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3066BE))),
            const SizedBox(height: 40),
        Row(
          children: [
            // IconTheme(
            //   data: IconThemeData(size: 24.0), // Устанавливаем размер значка
            //   child: Icon(
            //     Icons.account_circle_outlined,
            //     color: Color(int.parse('0xFF3066BE')),
            //   ),
            // ),
            Icon(
              Icons.account_circle_outlined,
              color: Color(int.parse('0xFF3066BE')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: const Text('Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Row(
            children: [
              // IconTheme(
              //   data: IconThemeData(size: 24.0), // Устанавливаем размер значка
              //   child: Icon(
              //     Icons.account_circle_outlined,
              //     color: Color(int.parse('0xFF3066BE')),
              //   ),
              // ),
              Icon(
                Icons.settings_outlined,
                color: Color(int.parse('0xFF3066BE')),
              ),
              GestureDetector(
                onTap: (){ Navigator.pushNamed(
                    context, 'settings');},
                child: Container(
                  margin: const EdgeInsets.only(left: 24.0),
                  child: const Text('Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Row(
            children: [
              // IconTheme(
              //   data: IconThemeData(size: 24.0), // Устанавливаем размер значка
              //   child: Icon(
              //     Icons.account_circle_outlined,
              //     color: Color(int.parse('0xFF3066BE')),
              //   ),
              // ),
              SvgPicture.asset("assets/icons/advert_icon.svg"),
              Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: const Text('My Adds',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Row(
            children: [
              // IconTheme(
              //   data: IconThemeData(size: 24.0), // Устанавливаем размер значка
              //   child: Icon(
              //     Icons.account_circle_outlined,
              //     color: Color(int.parse('0xFF3066BE')),
              //   ),
              // ),
              SvgPicture.asset("assets/icons/logout_icon.svg"),
              Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: const Text('Log out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 26.0),
          child: Row(
            children: [
              // IconTheme(
              //   data: IconThemeData(size: 24.0), // Устанавливаем размер значка
              //   child: Icon(
              //     Icons.account_circle_outlined,
              //     color: Color(int.parse('0xFF3066BE')),
              //   ),
              // ),
              SvgPicture.asset("assets/icons/trash_icon.svg"),
              Container(
                margin: const EdgeInsets.only(left: 24.0),
                child: const Text('Delete my account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
        )
          ],
        ),
      );
  }
}
