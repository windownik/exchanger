
import 'package:flutter/material.dart';

import '../../logic/curs.dart';
import '../../logic/main_screen_logic.dart';

class BottomCustomBar extends StatefulWidget{
  final MainScreenLogic? logic;
  const BottomCustomBar({super.key, this.logic});

  @override
  State<StatefulWidget> createState() {
    return BottomCustomBarState();
  }
}


class BottomCustomBarState extends State<BottomCustomBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(28, 143, 145, 1), Color.fromRGBO(27, 177, 180, 1),]
        )
      ),
      height: 300,
      child: Stack(children: [
        Positioned(child:
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 1,
          color: const Color.fromRGBO(171, 234, 255, 1),
        )
        ),
        const CustomRow()
      ])
    );
  }
}


class CustomRow extends StatelessWidget{
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BtnClear(),
            BtnReload(),
            OpenCalculator(),
          ],),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '7',),
          CustomCalcBtn(calcBtnText: '4',),
          CustomCalcBtn(calcBtnText: '1',),
            CustomCalcBtn(calcBtnText: '0',),
        ],),
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '8',),
          CustomCalcBtn(calcBtnText: '5',),
          CustomCalcBtn(calcBtnText: '2',),
            CustomCalcBtn(calcBtnText: ',',),
        ],),
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '9',),
          CustomCalcBtn(calcBtnText: '6',),
          CustomCalcBtn(calcBtnText: '3',),
            CustomCalcBtn(calcBtnText: '<',),
        ],)

      ],
    );
  }
}

class CustomCalcBtn extends StatefulWidget {
  String btnText = '1';

  CustomCalcBtn({super.key, required String calcBtnText}) {
    btnText = calcBtnText;
  }

  @override
  State<StatefulWidget> createState() {
    return CustomCalcBtnState(btnText: btnText);
  }
}

class CustomCalcBtnState extends State<CustomCalcBtn> {
  Color pressColor = const Color.fromRGBO(171, 234, 255, 1.0);
  String btnText = '1';
  bool press = false;
  final GestureTapCallback? onTap;
  CustomCalcBtnState({required this.btnText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return
    Stack(children: [
      Container(
      height: 40,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: press ? pressColor : Colors.transparent,
          width: 1
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(child: Text(btnText,
        style: const TextStyle(fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),),),
    ),
      Positioned(
        left: 2,
        bottom: 0,
          child: Container(height: 1, width: 76, color: pressColor,)
      ),
      SizedBox(
        height: 40,
        width: 80,
      child: Material(
          color: Colors.transparent,
          child: GestureDetector(
              onTapDown: (a) {
                press = true;
                setState(() { });
              },
              onTapUp: (a) {
                press = false;
                setState(() { });
              },
              onTapCancel: () {
                press = false;
                setState(() { });
              },
              onTap: onTap
          ),
      ),)
    ],);
  }
}

class BtnClear extends StatelessWidget{

  const BtnClear({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(200, 100, 150, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text("AC",
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(171, 234, 255, 1.0),
            ),),),
        ),
        SizedBox(
          height: 40,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
            ),
          ),)
      ],);

  }
}

class BtnReload extends StatelessWidget{

  const BtnReload({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(142, 133, 167, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Icon(Icons.refresh, color: Color.fromRGBO(171, 234, 255, 1.0),),
          ),
        ),
        SizedBox(
          height: 40,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                await getCryptoCurs();
              },
            ),
          ),)
      ],);
  }
}

class OpenCalculator extends StatelessWidget{
  const OpenCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 110,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(208, 101, 36, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Icon(Icons.calculate_outlined, size: 60, color: Color.fromRGBO(171, 234, 255, 1.0),),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pushNamed(context, "/calculator");
              },
            ),
          ),)
      ],);
  }
}