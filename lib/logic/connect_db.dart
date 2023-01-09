
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

  Future<String> getNumber2() async {
    final storage = await _storage;
    final number = storage.getString("number_line_2");
    if (number == null) {
      return '';
    }
    return number;
  }


  Future<String> getMinus() async {
    final storage = await _storage;
    final minus = storage.getString("minus");
    if (minus == null) {
      return '';
    }
    return minus;
  }

  Future<String> getState() async {
    final storage = await _storage;
    final state = storage.getString("state");
    if (state == null) {
      return '';
    }
    return state;
  }

  Future<String> getAllCurs() async {
    final storage = await _storage;
    final curs = storage.getString("curs");
    if (curs == null) {
      return '';
    }
    return curs;
  }

  Future<List<String>> getMyCurrency() async {
    final storage = await _storage;
    final curs = storage.getStringList("myCurrency");
    if (curs == null) {
      return [];
    }
    return curs;
  }

  Future<void> setMathSight(String math) async {
    final storage = await _storage;
    storage.setString("math_sight", math);
  }

  Future<void> setNumber(String number) async {
    final storage = await _storage;
    storage.setString("number_line", number);
  }

  Future<void> setMinus(String minus) async {
    final storage = await _storage;
    storage.setString("minus", minus);
  }

  Future<void> setState(String state) async {
    final storage = await _storage;
    storage.setString("state", state);
  }

  Future<void> setAllCurs(String curs) async {
    final storage = await _storage;
    storage.setString("curs", curs);
  }

  Future<void> setMyCurrency(List<String> myCurrency) async {
    final storage = await _storage;
    storage.setStringList("myCurrency", myCurrency);
  }
}

// DataBase db = DataBase();