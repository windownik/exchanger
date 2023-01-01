


import '../../logic/connect_db.dart';
import 'input_output_field.dart';

DataBase db = DataBase();


Future<String> saveBtn(String btnText) async {
  String numbers = await db.getNumber();
  if (numbers.startsWith("0,")) {
    numbers = numbers;
  } else if (numbers.startsWith("0")) {
    numbers = numbers.replaceFirst("0", '');
  }
  await db.setNumber("$numbers$btnText");
  return "$numbers$btnText";
}

Future<String> addPoint() async {

  String numbers = await db.getNumber();
  if (numbers.contains(',')) {
    return numbers;
  }
  await db.setNumber("$numbers,");
  return "$numbers,";
}

Future<MathCalculator> clearBtn(MathCalculator calc) async {
  calc.mathSight = '';
  calc.minus = '';
  calc.line = '0';
  await db.setNumber("0");
  await db.setMinus('');
  await db.setMathSight('');
  return calc;
}

Future<MathCalculator> deleteLustBtn(MathCalculator calc) async {
  String numbers = await db.getNumber();
  numbers = numbers.substring(0, numbers.length-1);
  calc.line = numbers;
  if (numbers.isEmpty) {
    calc.line = '0';
    calc.mathSight = '';
    calc.minus = '';
    await db.setMinus('');
    await db.setMathSight('');
  }
  await db.setNumber(numbers);
  return calc;
}

Future<MathCalculator> changeMinus(MathCalculator calc) async {
  if (calc.minus == '') {
    calc.minus = '-';
  } else {
    calc.minus = '';
  }
  await db.setMinus(calc.minus);
  return calc;
}

Future<MathCalculator> changeSight(MathCalculator calc, String sight) async {
  if (calc.mathSight == sight) {
    calc.mathSight = '';
  } else {
    calc.mathSight = sight;
  }
  await db.setMathSight(calc.mathSight);
  return calc;
}
