
import 'package:flutter/material.dart';
import '../../logic/connect_db.dart';
import 'calculator_logic.dart';
import 'input_output_field.dart';
import 'all_btns.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  MathCalculator calc = MathCalculator();
  DataBase db = DataBase();

  @override
  void initState() {
    setNumbers();
    super.initState();
  }
  void setNumbers () async {
    calc.line = await db.getNumber();
    calc.mathSight = await db.getMathSight();
    calc.minus = await db.getMinus();
    setState(() {});
  }

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
                InputOutputField(calc: calc,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: 'C', onTap: () async {calc = await clearBtn(calc); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '%',),
                    CustomCalcBtn(calcBtnText: '±', onTap: () async {calc = await changeMinus(calc); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '÷', onTap: () async {calc = await changeSight(calc, '÷'); setState(() {});},),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '7', onTap: () async {calc.line = await saveBtn("7"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '8', onTap: () async {calc.line = await saveBtn("8"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '9', onTap: () async {calc.line = await saveBtn("9"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: 'x', onTap: () async {calc = await changeSight(calc, 'x'); setState(() {});},),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '4', onTap: () async {calc.line = await saveBtn("4"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '5', onTap: () async {calc.line = await saveBtn("5"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '6', onTap: () async {calc.line = await saveBtn("6"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '-', onTap: () async {calc = await changeSight(calc, '-'); setState(() {});},),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '1', onTap: () async {calc.line = await saveBtn("1"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '2', onTap: () async {calc.line = await saveBtn("2"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '3', onTap: () async {calc.line = await saveBtn("3"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: '+', onTap: () async {calc = await changeSight(calc, '+'); setState(() {});},),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCalcBtn(calcBtnText: '0', onTap: () async {calc.line = await saveBtn("0"); setState(() {});},),
                    CustomCalcBtn(calcBtnText: ',', onTap: () async {calc.line = await addPoint(); setState(() {});},),
                    BtnDeleteLust(onTap: () async {calc = await deleteLustBtn(calc); setState(() {});},),
                    const ReturnToMain(),
                  ],
                ),
              ],
            )))
    );
  }
}
