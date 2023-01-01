
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class DataBase {
  final _storage = SharedPreferences.getInstance();

  Future<String> getMathSight() async {
    final storage = await _storage;
    final math = storage.getString("math_sight");
    if (math == null) {
      return '';
    }
    return math;
  }

  Future<String> getNumber() async {
    final storage = await _storage;
    final number = storage.getString("number_line");
    if (number == null) {
      return '';
    }
    return number;
  }

  Future<void> setMathSight(String math) async {
    final storage = await _storage;
    storage.setString("math_sight", math);
  }

  Future<void> setNumber(String number) async {
    final storage = await _storage;
    storage.setString("number_line", number);
  }

}