

import 'package:flutter/material.dart';

import 'bottom_custom_bar.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}


class StartScreenState extends State<StartScreen>{
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
        body: const SingleChildScrollView(child: Center(child: Text("Exchanger"),),),

        bottomNavigationBar: const BottomCustomBar(),
      ),
    );
  }
}
