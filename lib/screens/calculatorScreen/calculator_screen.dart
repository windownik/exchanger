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
  bool pressToMain = false;

  @override
  void initState() {
    setNumbers();
    super.initState();
  }

  void setNumbers() async {
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
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(30, 76, 77, 1),
                      Color.fromRGBO(60, 160, 163, 1),
                    ]
                  )
                ),
              ),
              title: const Text(
                'CALCULATOR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
                centerTitle: true,
            ),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(27, 74, 75, 1),
                    Color.fromRGBO(29, 176, 180, 1),
                  ])),
              child: Padding(
                  padding: const EdgeInsets.all(
                    18.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 1,
                        color: const Color.fromARGB(250, 194, 176, 176),
                      ),
                      // const SizedBox(height: 10,),
                      InputOutputField(
                        calc: calc,
                      ),
                      // const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCalcBtn(
                            calcBtnText: 'AC',
                            onTap: () async {
                              if (calc.state == "num1" && calc.line != '0') {
                                calc.line = '0';
                              } else if (calc.state == "num2" &&
                                  calc.lineSecond != '0') {
                                calc.lineSecond = '0';
                              } else {
                                calc = await clearBtn(calc);
                              }
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '%',
                          ),
                          CustomCalcBtn(
                            calcBtnText: '±',
                            onTap: () async {
                              calc = await changeMinus(calc);
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '÷',
                            onTap: () {
                              calc = changeSight(calc, '÷');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCalcBtn(
                            calcBtnText: '7',
                            onTap: () {
                              calc = saveBtn(calc, "7");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '8',
                            onTap: () {
                              calc = saveBtn(calc, "8");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '9',
                            onTap: () {
                              calc = saveBtn(calc, "9");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: 'x',
                            onTap: () {
                              calc = changeSight(calc, 'x');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCalcBtn(
                            calcBtnText: '4',
                            onTap: () {
                              calc = saveBtn(calc, "4");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '5',
                            onTap: () {
                              calc = saveBtn(calc, "5");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '6',
                            onTap: () {
                              calc = saveBtn(calc, "6");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '-',
                            onTap: () {
                              calc = changeSight(calc, '-');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCalcBtn(
                            calcBtnText: '1',
                            onTap: () {
                              calc = saveBtn(calc, "1");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '2',
                            onTap: () {
                              calc = saveBtn(calc, "2");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '3',
                            onTap: () {
                              calc = saveBtn(calc, "3");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: '+',
                            onTap: () {
                              calc = changeSight(calc, '+');
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCalcBtn(
                            calcBtnText: '0',
                            onTap: () {
                              calc = saveBtn(calc, "0");
                              setState(() {});
                            },
                          ),
                          CustomCalcBtn(
                            calcBtnText: ',',
                            onTap: () {
                              calc = addPoint(calc);
                              setState(() {});
                            },
                          ),
                          BtnDeleteLust(
                            onTap: () async {
                              calc = await deleteLustBtn(calc);
                              setState(() {});
                            },
                          ),
                          ReturnToMain(
                            press: pressToMain,
                            equal: calc.state == "num2" ? true : false,
                            onTapDown: (a) {
                              pressToMain = true;
                              setState(() { });
                            },
                            onTapUp: (a) {
                              pressToMain = false;
                              setState(() { });
                            },
                            onTapCancel: () {
                              pressToMain = false;
                              setState(() { });
                            },
                            onTap: () async {
                              if (calc.state == 'num2') {
                                calc = equalMath(calc);
                                calc.state = "equal";
                                calc.mathSight = "";
                                setState(() {});
                              } else {
                                await db.setNumber(calc.line);
                                Navigator.pushNamed(context, "/");
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
