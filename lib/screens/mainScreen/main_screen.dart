import 'dart:convert';

import 'package:exchanger/logic/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/curs.dart';
import '../../logic/flags.dart';
import '../../logic/main_screen_logic.dart';
import '../settings/settings_screen.dart';
import 'bottom_custom_bar.dart';
import 'custom_app_bar_main.dart';
import 'money_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {
  List<String> myCurrency = [];
  List<bool> active = [];
  List<dynamic> currency = [];
  MainScreenLogic logic = MainScreenLogic(mainNumber: '0');
  Map<String, dynamic> actualCurs = {};

  DataBase db = DataBase();
  @override
  void initState() {
    getCurrency();
    super.initState();
  }

  void getCurrency() async {
    currency = await getAllCurrency();
    String allCurs = await getMosCurs();
    myCurrency = await db.getMyCurrency();
    await db.setAllCurs(allCurs);
    for (int i = 0; i < myCurrency.length; i++) {
      active.add(false);
    }
    setState(() {});
  }

  void getCurs() async {
    String cursData = await db.getAllCurs();
    actualCurs = jsonDecode(cursData);
  }

  Widget customMainList(BuildContext context) {
    if (myCurrency.isEmpty) {
      return const Center(
          child: Text(
        "You list is empty.",
        style: TextStyle(color: Colors.white, fontSize: 32),
      ));
    } else if (actualCurs.isEmpty) {
      return const Center(
          child: Text(
        "Loading...",
        style: TextStyle(color: Colors.white, fontSize: 32),
      ));
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myCurrency.length,
                itemBuilder: (BuildContext context, int index) {
                  // active.add(false);
                  String currencyName = myCurrency[index];
                  String imgPath = flags[currencyName] ?? "";
                  String currencyCurs = "1";
                  if (currencyName != "RUB") {
                    currencyCurs =
                        actualCurs['Valute'][currencyName]['Value'].toString();
                  }
                  return MoneyCard(
                    currencyName: currencyName,
                    number: currencyCurs,
                    imgPath: imgPath,
                    sideLength: active[index] ? Get.width-20 : 137,
                    onTap: () {
                      List<bool> newActive = [];
                      for (int i = 0; i < myCurrency.length; i++) {
                        newActive.add(false);
                      }
                      newActive.removeAt(index);
                      newActive.insert(index, true);
                      active.clear();
                      active = newActive;
                      setState(() { });
                    },
                  );
                }),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    getCurs();
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
        // bottomSheet: Container(height: 300, color: Colors.white,),
        appBar: CustomAppBarMain(
          onPressedSettings: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return CustomSettings(
                    onPressSave: () async {
                      myCurrency = await db.getMyCurrency();
                      int position = active.indexOf(true);
                      active.clear();
                      for (int i = 0; i < myCurrency.length; i++) {
                        active.add(false);
                      }
                      if (position >= 0 && position <= myCurrency.length - 1) {
                        active.removeAt(position);
                        active.insert(position, true);
                      }
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                  );
                });
          },
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(27, 74, 75, 1.0),
                Color.fromRGBO(28, 143, 145, 1)
              ])),
          child: customMainList(context),
        ),

        bottomNavigationBar: BottomCustomBar(
          onTapReload: () async {
            db = DataBase();
            myCurrency = await db.getMyCurrency();
            setState(() {});
          },
          onTap0: () {
            logic.addOneNumber('0');
            setState(() {});
          },
          onTap1: () {
            logic.addOneNumber('1');
            setState(() {});
          },
          onTap2: () {
            logic.addOneNumber('2');
            setState(() {});
          },
          onTap3: () {
            logic.addOneNumber('3');
            setState(() {});
          },
          onTap4: () {
            logic.addOneNumber('4');
            setState(() {});
          },
          onTap5: () {
            logic.addOneNumber('5');
            setState(() {});
          },
          onTap6: () {
            logic.addOneNumber('6');
            setState(() {});
          },
          onTap7: () {
            logic.addOneNumber('7');
            setState(() {});
          },
          onTap8: () {
            logic.addOneNumber('8');
            setState(() {});
          },
          onTap9: () {
            logic.addOneNumber('9');
            setState(() {});
          },
          onTapPoint: () {},
          onTapBackspace: () {},
        ),
      ),
    );
  }
}
