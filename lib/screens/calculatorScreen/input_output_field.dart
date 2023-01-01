

import 'package:flutter/material.dart';

class InputOutputField extends StatelessWidget {
  String _line = '';
  InputOutputField({super.key, required String line}) {
    _line = line;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(131, 179, 177, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(_line,
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
    );
  }
}