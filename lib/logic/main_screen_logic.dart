
class MainScreenLogic {
  String mainNumber;

  MainScreenLogic({required this.mainNumber});

  void addOneNumber(String one) {
    if (mainNumber == '0') {
      mainNumber = one;
    } else {
      mainNumber = "$mainNumber$one";
    }
  }
}