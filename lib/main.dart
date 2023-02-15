import 'package:exchanger/screens/calculatorScreen/calculator_screen.dart';
import 'package:exchanger/screens/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MobileAds.instance.initialize();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exchanger',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/calculator': (context) => const CalculatorScreen(),
      },
    );
  }
}