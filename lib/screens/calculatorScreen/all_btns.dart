

import 'package:flutter/material.dart';


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
  CustomCalcBtnState({this.onTap, required String calcBtnText}) {
    btnText = calcBtnText;
  }

  String btnText = '1';


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(122, 115, 180, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              btnText,
              style: const TextStyle(
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
              onTap: onTap
              //     () async {
              //
              //   String numbers = await db.getNumber();
              //   await db.setNumber("$numbers$btnText");
              //   numbers = await db.getNumber();
              //   print([btnText, numbers]);
              //   setState(() {});
              // },
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

class BtnDeleteLust extends StatelessWidget {
  final GestureTapCallback? onTap;
  const BtnDeleteLust({super.key, this.onTap});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 100, 131, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(Icons.backspace_outlined),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}


class ReturnToMain extends StatelessWidget {
  const ReturnToMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(208, 101, 36, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text("OK")
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
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
        )
      ],
    );
  }
}