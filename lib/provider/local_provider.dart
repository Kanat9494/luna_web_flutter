import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  //TODO кыргызский язык также не работает

  Locale get locale {
    //TODO Shared preferences иногда работают иногда нет

    // SharedPreferences.getInstance().then((prefs) {
    //   String languageCode = prefs.getString('languageCode') ?? 'En';
    //   return _locale = Locale(languageCode);
    // });
    return _locale;
    // return _locale;
  }

  Future<Locale> getSavedLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'en';
    return Locale(languageCode);
  }

  void setLocale(Locale? locale) {
    if (!L10n.all.contains(locale)) return;
    saveLocale(locale?.languageCode ?? 'en');
    _locale = locale ?? const Locale('en');
    notifyListeners();
  }

  void saveLocale(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
