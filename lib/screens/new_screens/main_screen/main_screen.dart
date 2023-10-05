import 'package:exchanger/logic/connect_db.dart';
import 'package:exchanger/logic/curs.dart';
import 'package:exchanger/logic/my_colors.dart';
import 'package:exchanger/logic/objects.dart';
import 'package:exchanger/screens/mainScreen/bottom_custom_bar.dart';
import 'package:exchanger/screens/mainScreen/money_card.dart';
import 'package:exchanger/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<MainScreen> {
  DataBase db = DataBase();
  bool? sound;
  bool? vibration;
  bool load = false;
  List<String> myCurrencyNames = ['BYN', 'USD', 'GBP', 'RUB', 'TRY'];
  List<Currency> myCurrency = [];

  @override
  void initState() {
    loadSettings();
    loadCurs();
    super.initState();
  }

  void loadSettings() async {
    await db.getSound().then((sound1) async {
      sound = sound1;
      await db.getVibration().then((vibration2) {
        vibration = vibration2;
        load = true;
        setState(() {});
      });
    });
  }

  void loadCurs () async {
    List<Currency> myCurrency = [];
    List<Currency> currencyList = await getBelarusCurs();
    for (Currency one in currencyList) {
      if (myCurrencyNames.contains(one.name)) {
        myCurrency.add(one);
      }
    }
    this.myCurrency = myCurrency;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (!load) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyColors.primary,
                    MyColors.secondary
                  ])),
          child: const Center(
            child: CircularProgressIndicator(
                color: MyColors.white,
            ),
          ),
        ),

      );
    }

    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: ChangeNotifierProvider(
        create: (context) => MainProvider(sound: sound!, vibration: vibration!),
        child: PageView(
          children: [
            Scaffold(
              appBar: const MyAppBar(),
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          MyColors.primary,
                          MyColors.secondary
                        ])),
                child: Column(
                  children: [
                    Flexible(
                      child:
                      ListView.builder(
                          itemCount: myCurrency.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MoneyCard(
                              currency: myCurrency[index],
                              onTap: () {
                              },
                            );
                          }),
                    ),
                    BottomCustomBar()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
