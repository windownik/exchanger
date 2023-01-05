import 'package:flutter/material.dart';

class MoneyCard extends StatelessWidget {
  int _index = 0;
  int number = 0;
  MoneyCard({super.key, required int index, required this.number}) {
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      // decoration: BoxDecoration(
      //   color: const Color.fromRGBO(238, 116, 116, 1.0),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
                height: 34,
                width: 137,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(255, 255, 255, 1)),
                  color: const Color.fromRGBO(24, 160, 163, 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Элемент №$_index",
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 1),
                width: 135,
                height: 1,
              )),
          Positioned(
            right: 0,
            bottom: 8,
            child: Text(number.toString(),
                style: const TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
