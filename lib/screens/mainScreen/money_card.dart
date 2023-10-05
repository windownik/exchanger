import 'package:exchanger/logic/my_colors.dart';
import 'package:exchanger/logic/objects.dart';
import 'package:exchanger/logic/to_ranks.dart';
import 'package:exchanger/screens/new_screens/main_screen/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MoneyCard extends StatefulWidget {
  final Currency currency;
  final GestureTapCallback onTap;
  const MoneyCard({super.key, required this.currency, required this.onTap});

  @override
  State<MoneyCard> createState() => _MoneyCardState();
}

class _MoneyCardState extends State<MoneyCard> {
  late bool pressed;

  @override
  void initState() {
    pressed = widget.currency.pressed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Currency? pickedCurrency =
        Provider.of<MainProvider>(context, listen: true).pickCurrency;

    double inputMoney =
        Provider.of<MainProvider>(context, listen: true).inputMoney;
    double money = culculateMoney(
        currency: widget.currency,
        inputMoney: inputMoney,
        pickedCurrency: pickedCurrency);

    return GestureDetector(
      onTap: () {
        Provider.of<MainProvider>(context, listen: false).vibrate();
        Provider.of<MainProvider>(context, listen: false)
            .updatePickCurrency(widget.currency);
      },
      child: Container(
        height: 40,
        width: Get.width - 20,
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  width: widget.currency.name == pickedCurrency?.name
                      ? Get.width - 20
                      : 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: MyColors.white),
                    color: MyColors.secondary,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/flags/${widget.currency.imgPath}"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        widget.currency.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  )),
            ),
            Positioned(
                right: 8,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: widget.currency.name == pickedCurrency?.name
                      ? Colors.transparent
                      : MyColors.white,
                  width: 135,
                  height: 1,
                )),
            Positioned(
              right: 8,
              bottom: 8,
              child: Text(
                  toRanksCalc(number: money.toString()),
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

double culculateMoney(
    {required Currency currency,
    required double inputMoney,
    required Currency? pickedCurrency}) {
  if (currency.name == pickedCurrency?.name) {
    return inputMoney;
  }

  if (pickedCurrency == null) {
    double newMoney =  currency.scale * inputMoney / currency.number;
    return (newMoney * 1000 ~/ 1) / 1000;
  }

  double newMoney = currency.scale * inputMoney * pickedCurrency.number / (currency.number * pickedCurrency.scale);
  return (newMoney * 1000 ~/ 1) / 1000;
}
