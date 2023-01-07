import 'package:flutter/material.dart';

class MoneyCard extends StatelessWidget {
  String currencyName;
  String number;
  String imgPath;
  MoneyCard({super.key, required this.currencyName, required this.number, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),

      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
                height: 34,
                width: 137,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(255, 255, 255, 1)),
                  color: const Color.fromRGBO(24, 160, 163, 1),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(width: 9,),
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/flags/$imgPath"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(width: 30,),
                    Text(
                      currencyName,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                )
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 1),
                width: 135,
                height: 1,
              )),
          Positioned(
            right: 0,
            bottom: 8,
            child: Text(number,
                style: const TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
