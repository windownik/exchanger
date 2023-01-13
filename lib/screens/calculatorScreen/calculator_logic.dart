import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import '../../logic/connect_db.dart';
import 'input_output_field.dart';


MathCalculator saveBtn(MathCalculator calc, String btnText) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == 'math') {
    calc.state = 'num2';
    //Сохраняем для второго числа
    calc.lineSecond = btnText;
  } else if (calc.state == 'num2' && calc.lineSecond == ('0')) {
    calc.lineSecond = btnText;
  } else if (calc.state == 'num2') {
    calc.lineSecond = "${calc.lineSecond}$btnText";
  } else if (calc.state == 'equal') {
    calc.state = 'num1';
    calc.line = btnText;
  } else {
    if (calc.line.startsWith('0,')) {
    calc.line = "${calc.line}$btnText";
    } else if (calc.line.startsWith('0')){
      calc.line = btnText;
    } else {
      calc.line = "${calc.line}$btnText";
    }
  }
  return calc;
}

MathCalculator addPoint(MathCalculator calc) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == "num1") {
    String numbers = calc.line;
    if (numbers.contains('.')) {
      return calc;
    }
    calc.line = "$numbers.";
    return calc;
  } else if (calc.state == "num2") {
    String numbers = calc.lineSecond;
    if (numbers.contains('.')) {
      return calc;
    }
    calc.lineSecond = "$numbers.";
    return calc;
  } else {
    return calc;
  }

}

Future<MathCalculator> clearBtn(MathCalculator calc) async {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  calc.mathSight = '';
  calc.minus = '';
  calc.minusSecond = '';
  calc.line = '0';
  calc.lineSecond = '0';
  DataBase db = DataBase();
  await db.setNumber("0");
  await db.setMinus('');
  await db.setMathSight('');
  return calc;
}

MathCalculator deleteLustBtn(MathCalculator calc) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == "num1") {
    String numbers = calc.line;
    numbers = numbers.substring(0, numbers.length-1);
    calc.line = numbers;
    if (numbers.isEmpty) {
      calc.line = '0';
      calc.mathSight = '';
      calc.minus = '';
    }
  } else if (calc.state == "num2") {
    String numbers = calc.lineSecond;
    numbers = numbers.substring(0, numbers.length-1);
    calc.lineSecond = numbers;
    if (numbers.isEmpty) {
      calc.lineSecond = '0';
      calc.minusSecond = '';
    }
  } else { }
  return calc;

}

MathCalculator changeMinus(MathCalculator calc) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == "num1") {
    if (calc.minus == '') {
      calc.minus = '-';
    } else {
      calc.minus = '';
    }
  } else if (calc.state == "num2") {
    if (calc.minusSecond == '') {
      calc.minusSecond = '-';
    } else {
      calc.minusSecond = '';
    }
  }
  return calc;
}

MathCalculator percent(MathCalculator calc) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == "num1") {
    calc.line = (double.parse(calc.line)/100).toString();
  } else if (calc.state == "num2") {
    calc.lineSecond = (double.parse(calc.lineSecond)/100).toString();
  }
  return calc;
}

MathCalculator changeSight(MathCalculator calc, String sight) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  if (calc.state == "num1" || calc.state == "math") {
    if (calc.mathSight == sight) {
      calc.mathSight = '';
      calc.state = "num1";
    }  else {
      calc.mathSight = sight;
      calc.state = "math";
    }
  } else if (calc.state == "num2") {
    calc = equalMath(calc);
    calc.mathSight = sight;
  } else if (calc.state == "equal") {
    calc.mathSight = sight;
    calc.state = "math";
  }
  return calc;
}

MathCalculator equalMath(MathCalculator calc) {
  calc.haptic ? HapticFeedback.lightImpact() : {};
  calc.sound ? AudioPlayer().play(AssetSource('audio/click.mp3')) : {};
  double num1 = 0.0;
  double num2 = 0.0;
  double result = 0.0;
  //Число 1
  if (calc.minus == "-") {
    num1 = -double.parse(calc.line);
  } else {
    num1 = double.parse(calc.line);
  }
  //Число 2
  if (calc.minusSecond == "-") {
    num2 = -double.parse(calc.lineSecond);
  } else {
    num2 = double.parse(calc.lineSecond);
  }
  //Матеатика
  if (calc.mathSight == '+') {
    result = (num1 + num2);
  } else if (calc.mathSight == '-'){
    result = (num1 - num2);
  } else if (calc.mathSight == 'x'){
    result = (num1 * num2);
  } else if (calc.mathSight == '÷'){
    result = (num1 / num2);
  }
  result = _round(result);
  if (result%1 == 0.0) {
    calc.line = (result.toInt()).toString();
  } else {
    calc.line = result.toString();
  }
  calc.state = "math";
  calc.minus = "";
  calc.minusSecond = "";
  return calc;
}

double _round (double result) {
  result = result * 10000;
  return (result.round()/10000);
}
