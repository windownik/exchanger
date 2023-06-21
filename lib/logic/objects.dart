
import 'flags.dart';

class Currency {
  late String name;
  late int number;
  late String imgPath;

  Currency(this.name, this.imgPath, this.number) {
    imgPath = flags[name] ?? "";
  }
}