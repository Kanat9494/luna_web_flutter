import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ru'),
    const Locale('ky'),
  ];

  static String getTitle(String code) {
    switch (code) {
      case 'en':
        return 'En';
      case 'ru':
        return 'Ru';
      case 'ky':
        return 'Kg';
      default:
        return 'En';
    }
  }

  static Locale getLocale(String code) {
    switch (code) {
      case 'En':
        return const Locale('en');
      case 'Ru':
        return const Locale('ru');
      case 'Kg':
        return const Locale('ky');
      default:
        return const Locale('en');
    }
  }
}
