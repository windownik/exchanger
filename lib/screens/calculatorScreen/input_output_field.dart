

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../logic/to_ranks.dart';


class InputOutputField extends StatelessWidget {
  MathCalculator _calc = MathCalculator();
  InputOutputField({super.key, required MathCalculator calc}) {
    _calc = calc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(228, 255, 255, 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 138,
      alignment: Alignment.centerRight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(width: 5,),
            Container(width: 40,
              alignment: Alignment.center,
              child: _calc.mathSight == '' ? Text(_calc.mathSight,
                style: const TextStyle(fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(77, 77, 77, 1)),) : MathContainer(math: _calc.mathSight,)
            ),

        Flexible(
          // alignment: Alignment.centerRight,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            reverse: true,
            // alignment: Alignment.centerRight,
          child: Text(getNumbFromCalc(_calc),
          style: const TextStyle(fontSize: 49, fontWeight: FontWeight.w500, color: Color.fromRGBO(77, 77, 77, 1)), ),),
        )
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
      alignment: Alignment.center,
      child: Text(mathSight,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w500),),
    );
  }
}

String getNumbFromCalc (MathCalculator calc) {
  String returnText = "0";
  if (calc.state == 'num1' || calc.state == 'math' || calc.state == 'equal') {
    returnText = calc.minus == '-' ? "-${calc.line}" : calc.line;
  } else {
    returnText = calc.minusSecond == '-' ? "-${calc.lineSecond}" : calc.lineSecond;
  }
  return toRanksCalc(number: returnText);
}

class MathCalculator {
  String line = '0';
  String lineSecond = '0';
  String mathSight = '';
  String minus = '';
  String minusSecond = '';
  String state = 'num1';
  bool haptic = false;
  bool sound = false;
}
