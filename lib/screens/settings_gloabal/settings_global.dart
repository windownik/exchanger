import 'package:exchanger/logic/connect_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

const List<String> list = <String>['Auto', '0', '1', '2', '3', '4', '5', '6'];

class SettingsGlobal extends StatelessWidget {
  VoidCallback onPressed;
  SettingsGlobal({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1),
          child: Container(
            height: 300,
            width: 350,
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
                SettingsRowTittle(onPressed: onPressed,),
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
                const SoundRow(),
                const SizedBox(
                  height: 20,
                ),
                const VibrationRow()
              ],
            ),
          )),
    );
  }
}

class SettingsRowTittle extends StatelessWidget {
  VoidCallback onPressed;
  SettingsRowTittle({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // const SizedBox(
        //   width: 100,
        // ),
        const Text(
          'SETTINGS',
          style: TextStyle(
              fontSize: 25,
              color: Color.fromRGBO(29, 127, 129, 1),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 40,
        ),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.close,
              color: Color.fromRGBO(77, 77, 77, 1),
            ))
      ],
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
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Minimum accuracy',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 60,
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
    );
  }
}

class SoundRow extends StatefulWidget {
  const SoundRow({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SoundRow();
  }
}

class _SoundRow extends State<SoundRow> {
  String dropdownValue = list.first;
  DataBase db = DataBase();

  final _controller = ValueNotifier<bool>(false);
// ...
  @override
  void initState() {
    readSound();
    super.initState();
    _controller.addListener(() {
      setState(() {
        saveSound(_controller.value);
      });
    });
  }

  void saveSound(bool soundBool) async {
    await db.setSound(soundBool);
  }

  void readSound() async {
    bool soundBool = await db.getSound();
    _controller.value = soundBool;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Sound',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 145,
        ),
        Container(
          width: 76.0,
          height: 36.0,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(29, 127, 129, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          alignment: Alignment.center,
          child: AdvancedSwitch(
            controller: _controller,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            activeChild: const Text(
              'ON',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            inactiveChild: const Text(
              'OFF',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            width: 68.4,
            height: 32.4,
            enabled: true,
            disabledOpacity: 0.5,
            thumb: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(29, 127, 129, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VibrationRow extends StatefulWidget {
  const VibrationRow({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VibrationRow();
  }
}

class _VibrationRow extends State<VibrationRow> {
  String dropdownValue = list.first;
  bool switchBool = true;

  DataBase db = DataBase();

  final _controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    readVibration();
    super.initState();
    _controller.addListener(() {
      setState(() {
        saveVibration(_controller.value);
      });
    });
  }

  void saveVibration(bool soundBool) async {
    await db.setVibration(soundBool);
  }

  void readVibration() async {
    bool vibration = await db.getVibration();
    _controller.value = vibration;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Vibration response',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 33,
        ),
        Container(
          width: 76.0,
          height: 36.0,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(29, 127, 129, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          alignment: Alignment.center,
          child: AdvancedSwitch(
            controller: _controller,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            activeChild: const Text(
              'ON',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            inactiveChild: const Text(
              'OFF',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            width: 68.4,
            height: 32.4,
            enabled: true,
            disabledOpacity: 0.5,
            thumb: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(29, 127, 129, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

