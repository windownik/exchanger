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

  void clear() {
    mainNumber = '0';
  }

  void backspace() {
    if (mainNumber.length <= 1) {
      mainNumber = '0';
      return;
    }
    mainNumber = mainNumber.substring(0, mainNumber.length - 1);
  }

  void point() {
    if (!mainNumber.contains('.')) {
      mainNumber = '$mainNumber.';
      return;
    }

  }

  double getAmount() => double.parse(mainNumber);
  String getNumber() => mainNumber;
}

String getCursOfValute(
    {required double amount,
    required String activeItem,
    required int index,
    required List<String> myCurrency,
    required Map<String, dynamic> actualCurs}) {
  String currencyName = myCurrency[index];
  String currencyCurs = "1";
  if (activeItem == 'RUB') {
    if (amount == 0) {
      return '0';
    }
    currencyCurs = _activeItemRub(
        actualCurs: actualCurs, amount: amount, currencyName: currencyName);
  } else {
    if (amount == 0) {
      return '0';
    }
    currencyCurs = _activeItemNotRub(
        actualCurs: actualCurs,
        amount: amount,
        currencyName: currencyName,
        activeItem: activeItem);
  }
  return currencyCurs;
}

String _activeItemRub(
    {required double amount,
    required String currencyName,
    required Map<String, dynamic> actualCurs}) {
  String currencyCurs = amount.toString();
  if (currencyName != 'RUB') {
    int nominal = actualCurs['Valute'][currencyName]['Nominal'];
    double valuteToRub = actualCurs['Valute'][currencyName]['Value'];
    double currencyCursDouble = amount * nominal / valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  }
  return currencyCurs;
}

String _activeItemNotRub(
    {required double amount,
    required String currencyName,
    required String activeItem,
    required Map<String, dynamic> actualCurs}) {
  String currencyCurs = '1.0';
  if (currencyName != 'RUB') {
    int nominalActive = actualCurs['Valute'][activeItem]['Nominal'];
    double valuteToRubAcive = actualCurs['Valute'][activeItem]['Value'];
    valuteToRubAcive = valuteToRubAcive / nominalActive;

    int nominal = actualCurs['Valute'][currencyName]['Nominal'];
    double valuteToRub = actualCurs['Valute'][currencyName]['Value'];
    valuteToRub = valuteToRub / nominal;

    double currencyCursDouble = (amount * valuteToRubAcive) / valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  } else {
    double valuteToRub = actualCurs['Valute'][activeItem]['Value'];
    double currencyCursDouble = amount * valuteToRub;
    currencyCurs = currencyCursDouble.toString();
  }
  return currencyCurs;
}
