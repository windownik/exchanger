

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomCalcBtn extends StatefulWidget {
  String btnText = '1';
  final GestureTapCallback? onTap;
  CustomCalcBtn({required String calcBtnText, this.onTap}) {
    btnText = calcBtnText;
  }

  @override
  State<StatefulWidget> createState() {
    return CustomCalcBtnState(calcBtnText: btnText, onTap: onTap);
  }
}

class CustomCalcBtnState extends State<CustomCalcBtn> {
  final GestureTapCallback? onTap;
  Widget btnWidget = Text('1');
  CustomCalcBtnState({this.onTap, required String calcBtnText}) {
    btnText = calcBtnText;
    if (btnText == 'x'){
      btnWidget = SvgPicture.asset("assets/svg/multiple.svg", height: 20,);
    } else if (btnText == '±'){
      btnWidget = SvgPicture.asset("assets/svg/plus_minus.svg", height: 27,);
    } else if (btnText == '-'){
      btnWidget = SvgPicture.asset("assets/svg/minus.svg", height: 4,);
    } else {
      btnWidget = Text(
        btnText,
        style: const TextStyle(
          fontSize: 39,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(171, 234, 255, 1.0),
        ),
      );
    }

  }

  String btnText = '1';
  bool press = false;
  Color pressColor = const Color.fromRGBO(171, 234, 255, 1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 60,
          width: 80,
          child: Center(
            child: btnWidget,
          ),
        ),
        Positioned(
          bottom: 0,
            child: Container(
          width: 80,
          height: 1,
          color: const Color.fromRGBO(171, 234, 255, 1.0),)),
        Positioned(
            top: 0,
            child: Container(
              width: 80,
              height: 1,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
            left: 0,
            child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
            right: 0,
            child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        SizedBox(
          height: 60,
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
          ),
        )
      ],
    );
  }
}

class BtnClear extends StatelessWidget {
  const BtnClear({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(200, 100, 150, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "C",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ),
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
          ),
        )
      ],
    );
  }
}

class BtnDeleteLust extends StatefulWidget {
  final GestureTapCallback? onTap;
  BtnDeleteLust({this.onTap});

  @override
  State<StatefulWidget> createState() {
    return BtnDeleteLustState(onTap: onTap);
  }
}

class BtnDeleteLustState extends State<BtnDeleteLust> {
  final GestureTapCallback? onTap;
  BtnDeleteLustState({this.onTap});
  bool press = false;
  Color pressColor = const Color.fromRGBO(171, 234, 255, 1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Container(
              width: 80,
              height: 1,
              color: const Color.fromRGBO(171, 234, 255, 1.0),)),
        Positioned(
          top: 0,
          child: Container(
              width: 80,
              height: 1,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
          left: 0,
          child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
          right: 0,
          child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
          bottom: 20,
          child: SizedBox(
          height: 24,
          width: 80,
          child: SvgPicture.asset("assets/svg/backspace.svg", height: 10,),
        ),),
        SizedBox(
          height: 60,
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
          ),
        )
      ],
    );
  }
}


class ReturnToMain extends StatelessWidget {
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCancelCallback? onTapCancel;
  bool equal;
  bool press = false;
  Color pressColor = const Color.fromRGBO(171, 234, 255, 1.0);

  ReturnToMain({super.key, this.onTap, this.equal = false, this.onTapDown,
    this.onTapUp, this.onTapCancel, this.press = false});


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Container(
              width: 80,
              height: 1,
              color: const Color.fromRGBO(171, 234, 255, 1.0),)),
        Positioned(
          top: 0,
          child: Container(
              width: 80,
              height: 1,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
          left: 0,
          child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        Positioned(
          right: 0,
          child: Container(
              width: 1,
              height: 80,
              color: press ? pressColor : Colors.transparent),),
        SizedBox(
          height: 60,
          width: 80,
          child: Center(
            child: equal == true ? const Text("=", style: TextStyle(fontSize: 39, color: Color.fromRGBO(171, 234, 255, 1.0)),) :
            SvgPicture.asset("assets/svg/back.svg", height: 20,)
          ),
        ),
        SizedBox(
          height: 60,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
                onTapDown: onTapDown,
                onTapUp: onTapUp,
                onTapCancel: onTapCancel,
                onTap: onTap
            ),
          ),
        )
      ],
    );
  }
}