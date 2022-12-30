

import 'package:flutter/material.dart';

class MoneyCard extends StatelessWidget{
  int _index = 0;
  MoneyCard({super.key, required int index}){
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(238, 116, 116, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text("Индекс элемента №$_index",
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

}
