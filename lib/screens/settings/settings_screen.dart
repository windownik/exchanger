import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/connect_db.dart';
import '../../logic/currency.dart';
import '../../logic/curs.dart';

class CustomSettings extends StatefulWidget {
  GestureTapCallback onPressSave;
  CustomSettings({super.key, required this.onPressSave});

  @override
  State<StatefulWidget> createState() {
    return CustomSettingsState(onPressSave: onPressSave);
  }
}

class CustomSettingsState extends State<CustomSettings> {
  List<dynamic> currency = [];
  List<String> myCurrency = [];
  GestureTapCallback onPressSave;

  CustomSettingsState({required this.onPressSave});

  DataBase db = DataBase();
  @override
  void initState() {
    getCurrency();
    super.initState();
  }

  void getCurrency() async {
    currency = await getAllCurrency();
    myCurrency = await db.getMyCurrency();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.85,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(27, 74, 75, 1.0),
                Color.fromRGBO(29, 176, 180, 1)
              ])),
      child: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          SizedBox(
            height: 25,
            width: double.infinity,
            child: Stack(
              children: [
                const Center(
                    child: Text(
                  'CURRENCIES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
                Positioned(
                  right: 20,
                    top: -10,
                    child: TextButton(onPressed: onPressSave,
                    child: const Text('save', style: TextStyle(color: Color.fromRGBO(171, 234, 255, 1), fontSize: 20, decoration: TextDecoration.underline,),)))
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(width: Get.width*0.9,
            child: const TextField(

              style: TextStyle(
                color: Color.fromRGBO(171, 234, 255, 1),
              ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(171, 234, 255, 1)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(171, 234, 255, 1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(171, 234, 255, 1)),
                  ),
                  hintText: 'Search',
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(171, 234, 255, 1)),
              ),

            ),
          ),
          const SizedBox(height: 20,),
          currency.isNotEmpty ?
          Flexible(child: ListView.builder(
              itemCount: currency.length,
              itemBuilder: (BuildContext context, int index) {
                String imgPath = currency[index]['flag'];
                String currencyShort = currency[index]['sight'];
                String currencyDesc = currency[index]['desc'];
                bool showCard = false;

                if (myCurrency.contains(currencyShort)) {
                  showCard = true;
                }
                return CustomCurrencyCard(imgPath: imgPath,
                  currencyShort: currencyShort, currencyDesc: currencyDesc,
                  showCard: showCard,);

              })
            ) : const Text("Loading...")


        ],
      ),
    );
  }
}
