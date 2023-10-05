
import 'package:exchanger/logic/my_colors.dart';
import 'package:exchanger/pop_ups/settings_global.dart';
import 'package:exchanger/screens/new_screens/main_screen/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Provider.of<MainProvider>(context, listen: false).clickSound();
          Provider.of<MainProvider>(context, listen: false).vibrate();
        },
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await showDialog(context: context, builder: (builder) {
              return AppSettings(sound: Provider.of<MainProvider>(context, listen: false).sound,
                vibrate: Provider.of<MainProvider>(context, listen: false).vibration,);
            }).then((value) {
              Provider.of<MainProvider>(context, listen: false).reloadSettings();
            });
          },
          icon: const Icon(Icons.settings),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.primary,
                  MyColors.secondary,
                ])),
      ),
      title: SizedBox(
        // width: 118,
        child: RichText(text: const TextSpan(
          children: [
            TextSpan(text: 'EX', style: TextStyle(color: MyColors.third, fontSize: 20, fontWeight: FontWeight.w600)),
            TextSpan(text: 'CHANGER', style: TextStyle(color: MyColors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        )),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
