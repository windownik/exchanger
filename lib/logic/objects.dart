
import 'flags.dart';

class Currency {
  late String name;
  late double number;
  late int scale;
  late String imgPath;
  bool pressed = false;

  Currency._(this.name, this.imgPath, this.number, this.scale);

  factory Currency.fromApi({
    required Map<String, dynamic> data,
  }) {
    String name = data['Cur_Abbreviation'];
    double number = data['Cur_OfficialRate'];
    int scale = data['Cur_Scale'];
    String imgPath = flags[name] ?? "jp.png";
    return Currency._(name, imgPath, number, scale);
}

  factory Currency.createByn() {
    String name = 'BYN';
    double number = 1;
    int scale = 1;
    String imgPath = flags[name] ?? "jp.png";
    return Currency._(name, imgPath, number, scale);
  }

  void updatePressed() {
    pressed = !pressed;
  }
}