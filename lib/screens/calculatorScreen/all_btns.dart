

import 'package:flutter/material.dart';

import '../../logic/conect_db.dart';

class CustomCalcBtn extends StatefulWidget {
  String btnText = '1';

  CustomCalcBtn({required String calcBtnText}) {
    btnText = calcBtnText;
  }

  @override
  State<StatefulWidget> createState() {
    return CustomCalcBtnState(calcBtnText: btnText);
  }
}

class CustomCalcBtnState extends State<CustomCalcBtn> {
  DataBase db = DataBase();

  CustomCalcBtnState({required String calcBtnText}) {
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
              onTap: () async {

                String numbers = await db.getNumber();
                await db.setNumber("$numbers$btnText");
                print([btnText, numbers]);
                setState(() {});
              },
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
  const BtnDeleteLust({super.key});

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
              onTap: () {},
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