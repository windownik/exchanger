import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';

import 'connect_db.dart';

class MainScreenLogic {
  String mainNumber, roundNumber;
  bool haptic = true, sound = true, toZero = true;
  int activeCurrency = 0;

  MainScreenLogic({required this.mainNumber, required this.roundNumber});

  void addOneNumber(String one) async {
    DataBase db = DataBase();
    if (toZero) {
      mainNumber = '0';
    }
    haptic ? HapticFeedback.lightImpact() : {};
    sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
    toZero = false;
    if (mainNumber == '0') {
      mainNumber = one;
    } else if (double.parse("$mainNumber$one") > 10000000000000.0) {
      mainNumber = mainNumber;
    } else {
      mainNumber = "$mainNumber$one";
    }
    await db.setNumber(mainNumber);
  }

  void clear() {
    haptic ? HapticFeedback.lightImpact() : {};
    sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
    mainNumber = '0';
  }

  void backspace() {
    haptic ? HapticFeedback.lightImpact() : {};
    sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
    if (mainNumber.length <= 1) {
      mainNumber = '0';
      return;
    }
    mainNumber = mainNumber.substring(0, mainNumber.length - 1);
  }

  void point() {
    toZero = false;
    haptic ? HapticFeedback.lightImpact() : {};
    sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
    if (!mainNumber.contains('.')) {
      mainNumber = '$mainNumber.';
      return;
    }

  }

  double getAmount() => double.parse(mainNumber);
  String getNumber() => mainNumber;
}

String getCursOfValute(
    {required double amount,
    required String activeItem,
      required String roundNumber,
    required int index,
    required List<String> myCurrency,
    required Map<String, dynamic> actualCurs}) {
  String currencyName = myCurrency[index];
  String currencyCurs = "1";
  if (currencyName == activeItem) {
    return roundCurs(amount.toString(), roundNumber);
  } else if (activeItem == 'RUB') {
    if (amount == 0) {
      return '0';
    }
    currencyCurs = _activeItemRub(
        actualCurs: actualCurs, amount: amount, currencyName: currencyName);
  } else {
    if (amount == 0) {
      return '0';
    }
    currencyCurs = _activeItemNotRub(
        actualCurs: actualCurs,
        amount: amount,
        currencyName: currencyName,
        activeItem: activeItem);
  }
  return roundCurs(currencyCurs, roundNumber);
}

String _activeItemRub(
    {required double amount,
    required String currencyName,
    required Map<String, dynamic> actualCurs}) {
  String currencyCurs = amount.toString();
  if (currencyName != 'RUB') {
    int nominal = actualCurs['Valute'][currencyName]['Nominal'];
    double valuteToRub = actualCurs['Valute'][currencyName]['Value'];
    double currencyCursDouble = amount * nominal / valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  }
  return currencyCurs;
}

String _activeItemNotRub(
    {required double amount,
    required String currencyName,
    required String activeItem,
    required Map<String, dynamic> actualCurs}) {
  String currencyCurs = '1.0';
  if (currencyName != 'RUB') {
    int nominalActive = actualCurs['Valute'][activeItem]['Nominal'];
    double valuteToRubAcive = actualCurs['Valute'][activeItem]['Value'];
    valuteToRubAcive = valuteToRubAcive / nominalActive;

    int nominal = actualCurs['Valute'][currencyName]['Nominal'];
    double valuteToRub = actualCurs['Valute'][currencyName]['Value'];
    valuteToRub = valuteToRub / nominal;

    double currencyCursDouble = (amount * valuteToRubAcive) / valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  } else {
    double valuteToRub = actualCurs['Valute'][activeItem]['Value'];
    double currencyCursDouble = amount * valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  }
  return currencyCurs;
}

String roundCurs (String currencyCurs, roundNumber) {
  String roundedCurs = '';
  if (roundNumber == 'Auto') {
    int roundNumb = 3;
    double cursDouble = double.parse(currencyCurs);
    double currencyCursInt = cursDouble * pow(10, roundNumb);
    roundedCurs = (currencyCursInt.round()/pow(10, roundNumb)).toString();
  } else if (roundNumber == '0') {
    double cursDouble = double.parse(currencyCurs);
    roundedCurs = cursDouble.round().toString();
  } else {
    int roundNumb = int.parse(roundNumber);
    double cursDouble = double.parse(currencyCurs);
    double currencyCursInt = cursDouble * pow(10, roundNumb);
    roundedCurs = (currencyCursInt.round()/pow(10, roundNumb)).toString();
  }
  if (roundedCurs.endsWith('.0')) {
    roundedCurs = roundedCurs.substring(0, roundedCurs.length-2);
  }
  return roundedCurs;
}
