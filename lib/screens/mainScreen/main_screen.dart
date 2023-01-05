

import 'package:flutter/material.dart';

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
  MainScreenLogic logic = MainScreenLogic();
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> money = [122, 4577, 45430, 212, 125, 5356, 123, 875, 459, 10454];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
        // bottomSheet: Container(height: 300, color: Colors.white,),
        appBar: CustomAppBarMain(onPressedSettings: () {
          showModalBottomSheet(context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (BuildContext context) {
            return  CustomSettings();
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
          child: ReorderableListView(

            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                final item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              });
            },
            children: [
              for (final item in items)
              ListTile(
                key: ValueKey(item),
                title: MoneyCard(index: item, number: money[item-1],),
              )
            ],
          ),
        ),

        bottomNavigationBar: BottomCustomBar(),
      ),
    );
  }
}
