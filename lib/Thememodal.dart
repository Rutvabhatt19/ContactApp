import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferances {
  static const  PREF_KEY = 'perf-key';
  setTheme(bool value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }
  getTheme() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getBool(PREF_KEY);

  }
}
class ThemeModal extends ChangeNotifier {
  bool _isDark = false;
  ThemePreferances _preferances = ThemePreferances();

  bool get isDark => _isDark;

  ThemeModal() {
    _isDark = false;
    _preferances = ThemePreferances();
    getPreferances();
  }

  getPreferances() async {
    _isDark = await _preferances.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferances.setTheme(value);
    notifyListeners();
  }
}