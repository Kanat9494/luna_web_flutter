import 'package:flutter/material.dart';
import '../widgets/dropdown_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future saveLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstLaunch', false);
  }

  @override
  Widget build(BuildContext context) {
    //final locale = Localizations.localeOf(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF3066BE),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(225, 47, 157, 241),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(top: 47),
                  width: 39,
                  height: 38,
                  child: const Center(
                      child: DropdownWidget(
                    dropdownListValues: ['En', 'Ru'],
                  ))),
            ],
          ),
          Text(AppLocalizations.of(context)!.helloWorld,
              style: TextStyle(color: Colors.white)),
          Text(
            AppLocalizations.of(context)!.welcomePageTitle,
            style: const TextStyle(color: Colors.white, fontSize: 19),
          ),
          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.continueBtn),
            onPressed: () async {
              saveLocale();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Home(),
                    transitionDuration: const Duration(milliseconds: 0),
                    reverseTransitionDuration: const Duration(microseconds: 0),
                  ));
            },
          )
        ],
      ),
    );
  }
}
