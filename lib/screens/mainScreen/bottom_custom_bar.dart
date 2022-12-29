
import 'package:flutter/material.dart';

class BottomCustomBar extends StatefulWidget{
  const BottomCustomBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return BottomCustomBarState();
  }
}


class BottomCustomBarState extends State<BottomCustomBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(189, 160, 160, 1.0),
      height: 380,
      child: const CustomRow()
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

class CustomCalcBtn extends StatelessWidget{
  String btnText = '1';
  CustomCalcBtn({super.key, required String calcBtnText}) {
    btnText = calcBtnText;
  }

  @override
  Widget build(BuildContext context) {
    return
    Stack(children: [
      Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(122, 115, 180, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(btnText,
        style: const TextStyle(fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),),),
    ),
      SizedBox(
        height: 80,
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

class BtnClear extends StatelessWidget{

  const BtnClear({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(200, 100, 150, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text("C",
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 1.0),
            ),),),
        ),
        SizedBox(
          height: 80,
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
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(142, 133, 167, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Icon(Icons.refresh),
          ),
        ),
        SizedBox(
          height: 80,
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

class OpenCalculator extends StatelessWidget{
  const OpenCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 170,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(208, 101, 36, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Icon(Icons.calculate_outlined, size: 60,),
          ),
        ),
        SizedBox(
          height: 170,
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