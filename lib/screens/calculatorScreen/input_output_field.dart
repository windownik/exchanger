

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class InputOutputField extends StatelessWidget {
  MathCalculator _calc = MathCalculator();
  InputOutputField({super.key, required MathCalculator calc}) {
    _calc = calc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(131, 179, 177, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      width: Get.width,
      alignment: Alignment.centerRight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 5,),
            Container(width: 40,
              alignment: Alignment.center,
              child: _calc.mathSight == '' ? Text(_calc.mathSight, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),) : MathContainer(math: _calc.mathSight,)
            ),

        Container(width: Get.width-65,
        alignment: Alignment.centerRight,
        child: Text(getNumbFromCalc(_calc),
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),)
      ])
    );
  }
}

class MathContainer extends StatelessWidget {
  String mathSight = '';
  MathContainer({super.key, required String math}){
    mathSight = math;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: Colors.black
        )
      ),
      alignment: Alignment.center,
      child: Text(mathSight,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w500),),
    );
  }
}

String getNumbFromCalc (MathCalculator calc) {
  String returnText = "0";
  if (calc.state == 'num1' || calc.state == 'math') {
    returnText = calc.minus == '-' ? "-${calc.line}" : calc.line;
  } else {
    returnText = calc.minusSecond == '-' ? "-${calc.lineSecond}" : calc.lineSecond;
  }

  return returnText;
}

class MathCalculator {
  String line = '0';
  String lineSecond = '0';
  String mathSight = '';
  String minus = '';
  String minusSecond = '';
  String state = 'num1';
}
