

import 'package:flutter/material.dart';

class CustomAppBarMain extends StatelessWidget implements PreferredSizeWidget{
  VoidCallback onPressedSettings;
  CustomAppBarMain({super.key, required this.onPressedSettings});


  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: IconButton(onPressed: () { },
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(onPressed: onPressedSettings,
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
                ]
            )
        ),
      ),
      title: const Text(
        'CALCULATOR',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}