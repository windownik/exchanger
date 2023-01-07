

import 'dart:convert';

import 'package:exchanger/logic/connect_db.dart';
import 'package:flutter/material.dart';

import '../../logic/curs.dart';
import '../../logic/main_screen_logic.dart';
import '../settings/settings_screen.dart';
import 'bottom_custom_bar.dart';
import 'custom_app_bar_main.dart';
import 'money_card.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}


class StartScreenState extends State<StartScreen>{

  List<dynamic> currency = [];
  Map<String, dynamic> actualCurs = {};

  DataBase db = DataBase();
  @override
  void initState() {
    getCurrensy();
    super.initState();
  }

  void getCurrensy() async {
    currency = await getAllCurrency();
    String allCurs = await getMosCurs();
    await db.setAllCurs(allCurs);
    setState(() {});
  }

  void getCurs() async {
    String cursData = await db.getAllCurs();
    actualCurs = jsonDecode(cursData);
  }

  MainScreenLogic logic = MainScreenLogic();
  List<String> usersItems = ["USD", "EUR", "RUB", "GBP"];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    getCurs();
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
        // bottomSheet: Container(height: 300, color: Colors.white,),
        appBar: CustomAppBarMain(onPressedSettings: () {
          showModalBottomSheet(context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (BuildContext context) {
            return  const CustomSettings();
              });
        },),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(27, 74, 75, 1.0), Color.fromRGBO(28, 143, 145, 1)]
            )
          ),
          child:
          currency.isNotEmpty ?
          ListView.builder(
              itemCount: usersItems.length,
              itemBuilder: (BuildContext context, int index) {
                String currencyName = usersItems[index];
                String imgPath = flags[currencyName] ?? "";
                String currencyCurs = "1";
                if (currencyName != "RUB") {
                  currencyCurs = actualCurs['Valute'][currencyName]['Value'].toString();
                }

                return MoneyCard(currencyName: currencyName, number: currencyCurs, imgPath: imgPath,);
              }
          ) : const Text("Loading...")
        ),

        bottomNavigationBar: BottomCustomBar(onTap: ()  async {
        String allCurs = await getMosCurs();
        await db.setAllCurs(allCurs);
        setState(() {});
      },
        ),
      ),
    );
  }
}


Map<String, String> flags = {
  "USD": "us.png",
  "EUR": "eur.png",
  "AUD": "au.png",
  "AZN": "az.png",
  "GBP": "gb.png",
  "AMD": "am.png",
  "BYN": "by.png",
  "BGN": "bg.png",
  "BRL": "br.png",
  "HUF": "hu.png",
  "HKD": "hk.png",
  "INR": "in.png",
  "KZT": "kz.png",
  "CAD": "ca.png",
  "KGS": "kg.png",
  "CNY": "cn.png",
  "MDL": "md.png",
  "NOK": "no.png",
  "PLN": "pl.png",
  "RON": "ro.png",
  "RUB": "ru.png",
  "SGD": "sg.png",
  "TJS": "tj.png",
  "TRY": "tr.png",
  "TMT": "tm.png",
  "UZS": "uz.png",
  "UAH": "ua.png",
  "CZK": "cz.png",
  "SEK": "se.png",
  "CHF": "ch.png",
  "ZAR": "za.png",
  "KRW": "kr.png",
  "JPY": "jp.png"
};

