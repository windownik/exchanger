

import 'package:flutter/material.dart';

import 'bottom_custom_bar.dart';
import 'money_card.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}


class StartScreenState extends State<StartScreen>{
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () { },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(onPressed: () {  },
              icon: const Icon(Icons.settings),
            ),
          ],
          centerTitle: true,
          title: const Text('Exchanger'
          ),
        ),
        body: ReorderableListView(

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
              title: MoneyCard(index: item,),
            )
          ],
        ),

        bottomNavigationBar: const BottomCustomBar(),
      ),
    );
  }
}
