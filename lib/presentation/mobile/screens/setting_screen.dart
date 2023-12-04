import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luna_web_flutter/presentation/themes.dart';
import '../../../provider/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text("Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              )),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).own().arrowBackIosIcon),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark mode"),
                Switch(
                  value: context.watch<ThemeModel>().isSwitched,
                  onChanged: (value) {
                    // final mode = PlatformDispatcher.instance.platformBrightness;
//                     final mode = View.of(context).platformDispatcher.platformBrightness;
//                     print(mode);
                    context.read<ThemeModel>().toggleMode(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
