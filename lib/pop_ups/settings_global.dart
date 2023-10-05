import 'package:exchanger/logic/connect_db.dart';
import 'package:exchanger/logic/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const List<String> list = <String>['Auto',];

class AppSettings extends StatefulWidget {
  final bool sound;
  final bool vibrate;
  
  const AppSettings({super.key, required this.sound, required this.vibrate,});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  late bool sound;
  late bool vibrate;

  @override
  void initState() {
    sound = widget.sound;
    vibrate = widget.vibrate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    DataBase db = DataBase();


    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1),
          child: Container(
            height: 300,
            width: 340,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromRGBO(228, 255, 255, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SettingsRowTittle(onPressed: (){
                  Navigator.of(context).pop();
                },),
                const SizedBox(
                  height: 10,
                ),
                const MinimumAccuracyRow(),
                Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromRGBO(121, 121, 121, 1),
                ),
                const SizedBox(
                  height: 33,
                ),
                SoundRow(sound: sound,
                    onChanged: (bool value) {
                  db.setSound(value);
                  sound = value;
                  setState(() {});
                }),
                const SizedBox(
                  height: 20,
                ),
                VibrationRow(vibrate: vibrate,
                    onChanged: (bool value) {
                      db.setVibration(value);
                      vibrate = value;
                      setState(() {});
                    }
                )
              ],
            ),
          )),
    );
  }
}

class SettingsRowTittle extends StatelessWidget {
  final VoidCallback onPressed;
  const SettingsRowTittle({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 30,
      child: Stack(
        children: [
          const Center(
            child: Text(
              'SETTINGS',
              style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(29, 127, 129, 1),
                  fontWeight: FontWeight.w400),
            ),
          ),

          Positioned(
            right: 0,
            top: -5,
            child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.close,
                  color: Color.fromRGBO(77, 77, 77, 1),
                )),
          )
        ],
      ),
    );
  }
}

class MinimumAccuracyRow extends StatefulWidget {
  const MinimumAccuracyRow({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MinimumAccuracyRow();
  }
}

class _MinimumAccuracyRow extends State<MinimumAccuracyRow> {
  DataBase db = DataBase();
  String dropdownValue = 'Auto';

  @override
  void initState() {
    getMinimumPoint();
    super.initState();
  }

  void getMinimumPoint() async {
    dropdownValue = await db.getRound();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Minimum accuracy',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w400),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(121, 121, 121, 1),
              size: 15,
            ),
            elevation: 8,
            style: const TextStyle(color: Color.fromRGBO(121, 121, 121, 1)),
            onChanged: (String? value) async {
              // This is called when the user selects an item.
              dropdownValue = value!;
              await db.setMinimum(value);
              setState(() {});
            },
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
            dropdownColor: const Color.fromRGBO(224, 226, 225, 1),
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class SoundRow extends StatelessWidget {
  final bool sound;
  final ValueChanged<bool>? onChanged;
  const SoundRow({super.key, required this.sound, this.onChanged});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sound',
            style: TextStyle(
                fontSize: 20,
                color: MyColors.black,
                fontWeight: FontWeight.w400),
          ),

          Container(
            width: 58.0,
            height: 36.0,
            decoration: BoxDecoration(
              border: Border.all(color:  MyColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            alignment: Alignment.center,
            child: CupertinoSwitch(
              activeColor: MyColors.primary,
              value: sound,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class VibrationRow extends StatelessWidget {
  final bool vibrate;
  final ValueChanged<bool>? onChanged;
  const VibrationRow({super.key, required this.vibrate, this.onChanged});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Vibration response',
            style: TextStyle(
                fontSize: 20,
                color: MyColors.black,
                fontWeight: FontWeight.w400),
          ),

          Container(
            width: 58.0,
            height: 36.0,
            decoration: BoxDecoration(
              border: Border.all(color:  MyColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            alignment: Alignment.center,
            child: CupertinoSwitch(
              activeColor: MyColors.primary,
              value: vibrate,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}