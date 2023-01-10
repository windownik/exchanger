
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomCustomBar extends StatefulWidget{
  GestureTapCallback onTapReload;
  GestureTapCallback onTap1;
  GestureTapCallback onTap2;
  GestureTapCallback onTap3;
  GestureTapCallback onTap4;
  GestureTapCallback onTap5;
  GestureTapCallback onTap6;
  GestureTapCallback onTap7;
  GestureTapCallback onTap8;
  GestureTapCallback onTap9;
  GestureTapCallback onTap0;
  GestureTapCallback onTapPoint;
  GestureTapCallback onTapBackspace;
  BottomCustomBar({super.key,
    required this.onTapReload,
    required this.onTap0,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5,
    required this.onTap6,
    required this.onTap7,
    required this.onTap8,
    required this.onTap9,
    required this.onTapPoint,
    required this.onTapBackspace,});

  @override
  State<StatefulWidget> createState() {
    return BottomCustomBarState(
      onTapReload: onTapReload,
      onTap1: onTap1,
      onTap2: onTap2,
      onTap3: onTap3,
      onTap4: onTap4,
      onTap5: onTap5,
      onTap6: onTap6,
      onTap7: onTap7,
      onTap8: onTap8,
      onTap9: onTap9,
      onTap0: onTap0,
      onTapPoint: onTapPoint,
      onTapBackspace: onTapBackspace,);
  }
}


class BottomCustomBarState extends State<BottomCustomBar>{
  GestureTapCallback onTapReload;
  GestureTapCallback onTap1;
  GestureTapCallback onTap2;
  GestureTapCallback onTap3;
  GestureTapCallback onTap4;
  GestureTapCallback onTap5;
  GestureTapCallback onTap6;
  GestureTapCallback onTap7;
  GestureTapCallback onTap8;
  GestureTapCallback onTap9;
  GestureTapCallback onTap0;
  GestureTapCallback onTapPoint;
  GestureTapCallback onTapBackspace;

  BottomCustomBarState({
    required this.onTapReload,
    required this.onTap0,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5,
    required this.onTap6,
    required this.onTap7,
    required this.onTap8,
    required this.onTap9,
    required this.onTapPoint,
    required this.onTapBackspace,});

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
        CustomRow(
          onTapReload: onTapReload,
          onTap1: onTap1,
          onTap2: onTap2,
          onTap3: onTap3,
          onTap4: onTap4,
          onTap5: onTap5,
          onTap6: onTap6,
          onTap7: onTap7,
          onTap8: onTap8,
          onTap9: onTap9,
          onTap0: onTap0,
          onTapPoint: onTapPoint,
          onTapBackspace: onTapBackspace,
        )
      ])
    );
  }
}


class CustomRow extends StatelessWidget{
  GestureTapCallback onTapReload;
  GestureTapCallback onTap1;
  GestureTapCallback onTap2;
  GestureTapCallback onTap3;
  GestureTapCallback onTap4;
  GestureTapCallback onTap5;
  GestureTapCallback onTap6;
  GestureTapCallback onTap7;
  GestureTapCallback onTap8;
  GestureTapCallback onTap9;
  GestureTapCallback onTap0;
  GestureTapCallback onTapPoint;
  GestureTapCallback onTapBackspace;
  CustomRow({super.key,
    required this.onTapReload,
    required this.onTap0,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5,
    required this.onTap6,
    required this.onTap7,
    required this.onTap8,
    required this.onTap9,
    required this.onTapPoint,
    required this.onTapBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 12,),
            const BtnClear(),
            const SizedBox(height: 24,),
            BtnReload(onTap: onTapReload,),
            const SizedBox(height: 20.5,),
            OpenCalculator(),
            const SizedBox(height: 20,)
          ],),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '7', onTap: onTap7,),
          CustomCalcBtn(calcBtnText: '4', onTap: onTap4,),
          CustomCalcBtn(calcBtnText: '1', onTap: onTap1,),
            CustomCalcBtn(calcBtnText: '0', onTap: onTap0,),
            const SizedBox(height: 20,)
        ],),
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '8', onTap: onTap8,),
          CustomCalcBtn(calcBtnText: '5', onTap: onTap5,),
          CustomCalcBtn(calcBtnText: '2', onTap: onTap2,),
            CustomCalcBtn(calcBtnText: ',', onTap: onTapPoint,),
            const SizedBox(height: 20,)
        ],),
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomCalcBtn(calcBtnText: '9', onTap: onTap9,),
          CustomCalcBtn(calcBtnText: '6', onTap: onTap6,),
          CustomCalcBtn(calcBtnText: '3', onTap: onTap3,),
            BtnBackspace(onTap: onTapBackspace,),
            const SizedBox(height: 20,)
        ],)

      ],
    );
  }
}

class CustomCalcBtn extends StatefulWidget {
  String btnText = '1';
  GestureTapCallback onTap;
  CustomCalcBtn({super.key, required String calcBtnText, required this.onTap}) {
    btnText = calcBtnText;
  }

  @override
  State<StatefulWidget> createState() {
    return CustomCalcBtnState(btnText: btnText, onTap: onTap);
  }
}

class CustomCalcBtnState extends State<CustomCalcBtn> {
  Color pressColor = const Color.fromRGBO(171, 234, 255, 1.0);
  String btnText = '1';
  bool press = false;
  GestureTapCallback onTap;
  CustomCalcBtnState({required this.btnText, required this.onTap});

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
            // color: const Color.fromRGBO(200, 100, 150, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text("AC",
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(171, 234, 255, 1.0),
            ),),),
        ),
        Positioned(bottom: 0,
            child: Container(height: 1, width: 80, color: const Color.fromRGBO(171, 234, 255, 1.0),)),
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

class BtnBackspace extends StatelessWidget{
  GestureTapCallback onTap;
  BtnBackspace({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            // color: const Color.fromRGBO(200, 100, 150, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset("assets/svg/backspace.svg", height: 24,),),
        ),
        Positioned(bottom: 0,
            child: Container(height: 1, width: 80, color: const Color.fromRGBO(171, 234, 255, 1.0),)),
        SizedBox(
          height: 40,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
            ),
          ),)
      ],);
  }
}

class BtnReload extends StatelessWidget{
  // DataBase db = DataBase();
  GestureTapCallback onTap;
  BtnReload({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            // color: const Color.fromRGBO(142, 133, 167, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset("assets/svg/reload.svg", height: 18,),
          ),
        ),
        Positioned(bottom: 0,
            child: Container(height: 1, width: 80, color: const Color.fromRGBO(171, 234, 255, 1.0),)),
        SizedBox(
          height: 40,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap
              //     () async {
              //   String allCurs = await getMosCurs();
              //   await db.setAllCurs(allCurs);
              // },
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
            // color: const Color.fromRGBO(208, 101, 36, 1.0),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Center(child: SvgPicture.asset("assets/svg/calculator.svg", height: 40,),
          ),
        ),
        Positioned(bottom: 2.5,
            child: Container(height: 1, width: 80, color: const Color.fromRGBO(171, 234, 255, 1.0),)),
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