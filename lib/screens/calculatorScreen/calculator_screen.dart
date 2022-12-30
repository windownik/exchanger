
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
          appBar: AppBar(),
            body: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Column(
              children: [
                const InputOutputField(),
                CustomCalcBtn(
                  calcBtnText: '1213',
                )
              ],
            )))
    );
  }
}
