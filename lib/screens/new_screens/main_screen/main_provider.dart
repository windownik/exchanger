
import 'package:exchanger/logic/connect_db.dart';
import 'package:exchanger/logic/objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class MainProvider extends ChangeNotifier {
  bool sound;
  bool vibration;
  Currency? pickCurrency;
  double inputMoney = 1;
  MainProvider({required this.sound, required this.vibration});

  AudioPlayer player = AudioPlayer();
  DataBase db = DataBase();

  void updatePickCurrency(Currency pickCurrency) {
    this.pickCurrency = pickCurrency;
    notifyListeners();
  }

  void vibrate() {
    if (vibration) {
      HapticFeedback.heavyImpact();
    }
  }

  void clickSound() {
    if (sound) {
      player.play(AssetSource('audio/click.mp3'));
    }
  }

  void reloadSettings() async {
    sound = await db.getSound();
    vibration = await db.getVibration();
    notifyListeners();
  }

  void updateSound(bool sound) {
    db.setSound(sound);
    this.sound = sound;
    notifyListeners();
  }

  void updateVibration(bool vibration) {
    db.setVibration(vibration);
    this.vibration = vibration;
    notifyListeners();
  }

}