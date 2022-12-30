
import 'package:flutter/material.dart';
import '../mainScreen/bottom_custom_bar.dart';
import 'input_output_field.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1),
        child: Scaffold(
            body: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Container(height: 1,
                  color: const Color.fromARGB(250, 194, 176, 176),),
                const SizedBox(height: 10,),
                const InputOutputField(),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: 'C',),
                    CustomCalcBtn(calcBtnText: '%',),
                    CustomCalcBtn(calcBtnText: '+/-',),
                    CustomCalcBtn(calcBtnText: '/',),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '7',),
                    CustomCalcBtn(calcBtnText: '8',),
                    CustomCalcBtn(calcBtnText: '9',),
                    CustomCalcBtn(calcBtnText: 'x',),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '4',),
                    CustomCalcBtn(calcBtnText: '5',),
                    CustomCalcBtn(calcBtnText: '6',),
                    CustomCalcBtn(calcBtnText: '-',),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '1',),
                    CustomCalcBtn(calcBtnText: '2',),
                    CustomCalcBtn(calcBtnText: '3',),
                    CustomCalcBtn(calcBtnText: '+',),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '0',),
                    CustomCalcBtn(calcBtnText: ',',),
                    CustomCalcBtn(calcBtnText: '<-',),
                    CustomCalcBtn(calcBtnText: 'OK',),
                  ],
                ),
              ],
            )))
    );
  }
}
