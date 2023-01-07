import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomCurrencyCard extends StatefulWidget {
  String imgPath, currencyShort, currencyDesc;
  CustomCurrencyCard(
      {super.key,
      required this.imgPath,
      required this.currencyShort,
      required this.currencyDesc});

  @override
  State<StatefulWidget> createState() {
    return CustomCurrencyCardState(
      imgPath: imgPath,
      currencyShort: currencyShort,
      currencyDesc: currencyDesc,
    );
  }
}

class CustomCurrencyCardState extends State<CustomCurrencyCard> {
  String imgPath, currencyShort, currencyDesc;
  bool showCard = false;
  CustomCurrencyCardState(
      {required this.imgPath,
      required this.currencyShort,
      required this.currencyDesc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showCard = !showCard;
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 18, right: 18),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PickSight(
                showSight: showCard,
              ),
              CardCurrencyInfo(
                imgPath: imgPath,
                currencyShort: currencyShort,
                currencyDesc: currencyDesc,
                showCard: showCard,
              )
            ],
          ),
        ));
  }
}

class CardCurrencyInfo extends StatelessWidget {
  bool showCard;
  String imgPath;
  String currencyShort;
  String currencyDesc;
  CardCurrencyInfo(
      {super.key,
      required this.imgPath,
      required this.currencyShort,
      required this.currencyDesc,
      required this.showCard});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SizedBox(
        width: Get.width - 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/flags/$imgPath"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 47,
                ),
                Text(
                  currencyShort,
                  style: const TextStyle(
                      color: Color.fromRGBO(224, 226, 225, 1), fontSize: 18),
                ),
              ],
            ),
            Text(
              currencyDesc,
              style: const TextStyle(
                  color: Color.fromRGBO(224, 226, 225, 1), fontSize: 18),
            )
          ],
        ),
      ),
      CustomLine(showColor: showCard)
    ]);
  }
}

class CustomLine extends StatelessWidget {
  bool showColor;
  CustomLine({super.key, required this.showColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 1,
      width: Get.width - 90,
      color: showColor
          ? const Color.fromRGBO(171, 234, 255, 1)
          : Colors.transparent,
    );
  }
}

class PickSight extends StatelessWidget {
  bool showSight = false;

  PickSight({super.key, required this.showSight});
  @override
  Widget build(BuildContext context) {
    if (showSight) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(3),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(24, 160, 163, 1),
            borderRadius: BorderRadius.circular(4)),
        child: SvgPicture.asset(
          "assets/svg/check_mark.svg",
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2.2, color: const Color.fromRGBO(171, 234, 255, 1)),
            borderRadius: BorderRadius.circular(4)),
      );
    }
  }
}
