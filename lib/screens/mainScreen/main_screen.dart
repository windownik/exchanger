import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:exchanger/logic/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../logic/curs.dart';
import '../../logic/flags.dart';
import '../../logic/main_screen_logic.dart';
import '../settings/settings_screen.dart';
import '../settings_gloabal/settings_global.dart';
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
  List<String> myCurrency = ['USD'];
  List<bool> active = [true];
  String activeItem = '', roundNumber = '0';
  List<dynamic> currency = [];
  MainScreenLogic logic = MainScreenLogic(mainNumber: '0', roundNumber: '0');
  Map<String, dynamic> actualCurs = {};
  Map<String, String> myCursOnDisplay = {};
  // BannerAd? bannerAd;
  bool isLoaded = false;

  DataBase db = DataBase();

  @override
  void initState() {
    getStartState();
    super.initState();
  }

  void getStartState() async {
    logic.mainNumber = await db.getNumber();
    logic.roundNumber = await db.getRound();
    logic.activeCurrency = await db.getActiveCurrency();
    logic.haptic = await db.getVibration();
    logic.sound = await db.getSound();
    logic.toZero = await db.getToZero();
    myCurrency = await db.getMyCurrency();
    currency = await getAllCurrency();
    roundNumber = logic.roundNumber;
    buildActive();
    getCurs();
    setState(() {});
  }

  void buildActive() async {
    active.clear();
    for (int i = 0; i < myCurrency.length; i++) {
      if (i == logic.activeCurrency) {
        activeItem = myCurrency[i];
        active.add(true);
      } else {
        active.add(false);
      }
    }
  }

  void getCurs() async {
    try {
      updateCurs();
    } catch (e) {
      String cursData = await db.getAllCurs();
      actualCurs = jsonDecode(cursData);
    }
    setState(() { });
  }

  void updateCurs() async {
    String cursData = await getMosCurs();
    await db.setAllCurs(cursData);
    actualCurs = jsonDecode(cursData);
    setState(() { });
  }

  void getShowDialogVars() async {
    roundNumber = await db.getRound();
  }


  Widget customMainList(BuildContext context) {
    activeItem = activeItem.isEmpty ? myCurrency[0] : activeItem;
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
            child:
            ListView.builder(
                itemCount: myCurrency.length,
                itemBuilder: (BuildContext context, int index) {
                  String currencyName = myCurrency[index];
                  String imgPath = flags[currencyName] ?? "";
                  String currencyCurs = getCursOfValute(
                      activeItem: activeItem,
                      index: index,
                      myCurrency: myCurrency,
                      actualCurs: actualCurs,
                      amount: logic.getAmount(),
                      roundNumber: roundNumber);
                  myCursOnDisplay[currencyName] = currencyCurs;
                  return MoneyCard(
                    currencyName: currencyName,
                    number: currencyCurs,
                    imgPath: imgPath,
                    sideLength: active[index] ? Get.width - 20 : 137,
                    onTap: () {
                      logic.mainNumber = myCursOnDisplay[currencyName] ?? '1';
                      logic.activeCurrency = index;
                      logic.toZero = true;
                      activeItem = currencyName;
                      List<bool> newActive = [];
                      for (int i = 0; i < myCurrency.length; i++) {
                        newActive.add(false);
                      }
                      newActive.removeAt(index);
                      newActive.insert(index, true);
                      active.clear();
                      active = newActive;
                      setState(() {});
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

    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
        appBar: CustomAppBarMain(
          onPressedSettings: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return CustomSettings(
                    onPressSave: () async {
                      DataBase db = DataBase();
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
          onPressedShowDialog: () {
            showDialog(
                barrierDismissible: false,
                context: (context),
                builder: (BuildContext context) {
                  getShowDialogVars();
                  return SettingsGlobal(
                    onPressed: () async {
                      db = DataBase();
                      logic.haptic = await db.getVibration();
                      logic.sound = await db.getSound();
                      roundNumber = await db.getRound();
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
            logic.haptic ? HapticFeedback.lightImpact() : {};
            updateCurs();
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
          onTapPoint: () {
            logic.point();
            setState(() {});
          },
          onTapBackspace: () {
            logic.backspace();
            setState(() {});
          },
          clear: () {
            logic.clear();
            setState(() {});
          },
          line: () async {
            logic.haptic ? HapticFeedback.lightImpact() : {};
            logic.sound
                ? AudioPlayer().play(AssetSource('audio/click.mp3'))
                : {};
            DataBase db = DataBase();
            await db.setNumber(logic.mainNumber);
            await db.setActiveCurrency(logic.activeCurrency);
            Timer(const Duration(milliseconds: 10), () {
              Navigator.pushNamed(context, "/calculator");
            });
          },
        ),
      ),
    );
  }
}
