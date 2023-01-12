
import 'package:get/get.dart';

String toRanks (int number) {
  String strNumber = '';
  int treeNumb = 0;
  while (true) {
    if (number > 1000) {
      treeNumb = number%1000;
      if (treeNumb == 0){
        strNumber = '000 $strNumber';
      } else if (treeNumb < 10){
        strNumber = '00$treeNumb $strNumber';
      } else if (treeNumb < 100) {
        strNumber = '0$treeNumb $strNumber';
      } else {
        strNumber = '$treeNumb $strNumber';
      }
      number = number~/1000;
    } else if (number == 1000) {
      strNumber = '1 000 $strNumber'.trimRight();
      break;
    } else {
      strNumber = '$number $strNumber'.trimRight();
      break;
    }
  }
  return strNumber;
}


String toRanksCalc ({required String number}) {
  String newNumber = '';
  String sight = '';
  if (number.startsWith('-')) {
    sight = '-';
    number = number.substring(1, number.length);
  }
  if (number.contains('.')) {
    List<String> newList = number.split('.');
    int intPart = int.parse(newList[0]);
    newNumber = '${toRanks(intPart)}.${newList[1]}';
  }
  else {
    newNumber = toRanks(int.parse(number));
  }

  return "$sight$newNumber";
}