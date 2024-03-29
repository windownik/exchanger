import 'package:flutter/material.dart';

import '../../logic/connect_db.dart';

class CustomAppBarMain extends StatelessWidget implements PreferredSizeWidget {
  DataBase db = DataBase();
  final VoidCallback onPressedSettings, onPressedShowDialog;
  CustomAppBarMain({super.key, required this.onPressedSettings,
    required this.onPressedShowDialog});

  bool vibration = true;
  bool sound = true;
  String dropdownValue = 'Auto';

  void getShowDialogVars() async {
    vibration = await db.getVibration();
    sound = await db.getSound();
    dropdownValue = await db.getRound();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressedShowDialog,
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: onPressedSettings,
          icon: const Icon(Icons.settings),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(30, 76, 77, 1),
              Color.fromRGBO(60, 160, 163, 1),
            ])),
      ),
      title: SizedBox(
        width: 118,
        child: Row(
          children: const [
            Text(
              'EX',
              style: TextStyle(
                  color: Color.fromRGBO(49, 216, 216, 1), fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'CHANGED',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
